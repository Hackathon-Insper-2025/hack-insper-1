import pandas as pd
import re
from sklearn.feature_extraction.text import CountVectorizer
import nltk
from nltk.corpus import stopwords
from nltk.tokenize import word_tokenize

nltk.download("punkt")
nltk.download("stopwords")

def clean_text(text):
    if not isinstance(text, str):
        return ""
    text = re.sub(r'[^\w\s]', '', text.lower())
    return text

def model(dbt, session):
    table_name = dbt.ref("reviews_dbt")
    df = session.table(table_name).to_pandas()

    df["clean_comment"] = df["review_comment_message"].apply(clean_text)
    df = df[df["clean_comment"].str.strip() != ""]

    stop_words = set(stopwords.words("portuguese"))
    df["tokens"] = df["clean_comment"].apply(
        lambda x: [word for word in word_tokenize(x) if word not in stop_words]
    )

    exploded = df.explode("tokens")

    result = exploded.groupby("tokens").agg(
        ocorrencias=("tokens", "count"),
        media_nota=("review_score", "mean")
    ).reset_index().rename(columns={"tokens": "palavra"})

    result = result.sort_values(by="ocorrencias", ascending=False).head(50)

    return result

# ===== EXECUTA AUTOMATICAMENTE QUANDO RODAR O SCRIPT =====
if __name__ == "__main__":
    from dex.dbt_context import get_dbt_context  # Suporte ao contexto no deX
    dbt, session = get_dbt_context()
    result = model(dbt, session)
    print(result)  # Pode ser omitido se a plataforma já captura o retorno
