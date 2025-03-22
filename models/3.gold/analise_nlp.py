import pandas as pd
# from sklearn.model_selection import train_test_split
# from sklearn.linear_model import LogisticRegression
# from sklearn.metrics import accuracy_score, precision_score, recall_score, f1_score

def model(dbt, session):
    table_name = dbt.ref('reviews_dbt')

    df = session.table(table_name).to_pandas()
    return df