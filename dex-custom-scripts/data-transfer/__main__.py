import pandas as pd
import re
from sklearn.feature_extraction.text import CountVectorizer
import nltk
from nltk.corpus import stopwords
from nltk.tokenize import word_tokenize

# Baixa as stopwords da primeira vez (deX pode usar cache)
nltk.download("punkt")
nltk.download("stopwords")

def clean_text(text):
    if not isinstance(text, str):
        return ""
    text = re.sub(r'[^\w\s]', '', text.lower())  # remove pontuação
    return text

def model(dbt, session):
    # Tabela com os comentários e notas
    table_name = dbt.ref("reviews_dbt")  
    df = session.table(table_name).to_pandas()

    # Limpeza básica
    df["clean_comment"] = df["review_comment_message"].apply(clean_text)
    df = df[df["clean_comment"].str.strip() != ""]

    # Tokenização e filtragem
    stop_words = set(stopwords.words("portuguese"))
    df["tokens"] = df["clean_comment"].apply(
        lambda x: [word for word in word_tokenize(x) if word not in stop_words]
    )

    # Explodindo tokens
    exploded = df.explode("tokens")

    # Agrupando por palavra
    result = exploded.groupby("tokens").agg(
        ocorrencias=("tokens", "count"),
        media_nota=("review_score", "mean")
    ).reset_index().rename(columns={"tokens": "palavra"})

    # Ordenar por frequência
    result = result.sort_values(by="ocorrencias", ascending=False).head(50)

    return result
