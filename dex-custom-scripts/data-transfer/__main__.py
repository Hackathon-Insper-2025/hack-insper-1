import pandas as pd
from nltk.corpus import stopwords
from nltk.tokenize import word_tokenize
import nltk

nltk.download('punkt')
nltk.download('stopwords')

def model(dbt, session):
    # Puxa a tabela de reviews limpa (silver)
    reviews_df = session.table(dbt.ref("review")).to_pandas()

    # Pré-processamento simples
    words_data = []
    stop_words = set(stopwords.words('portuguese'))

    for _, row in reviews_df.iterrows():
        tokens = word_tokenize(str(row["review_comment_message"]).lower())
        tokens = [t for t in tokens if t.isalpha() and t not in stop_words]

        for token in tokens:
            words_data.append((token, row["review_score"]))

    df = pd.DataFrame(words_data, columns=["palavra", "nota"])
    
    # Agrega
    result = (
        df.groupby("palavra")
        .agg(ocorrencias=("palavra", "count"), media_nota=("nota", "mean"))
        .reset_index()
        .sort_values(by="ocorrencias", ascending=False)
    )

    # ✅ aqui é o retorno final — a deX salva isso como uma tabela
    return result
