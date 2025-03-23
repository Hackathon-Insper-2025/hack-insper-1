# import pandas as pd
# # from sklearn.model_selection import train_test_split
# # from sklearn.linear_model import LogisticRegression
# # from sklearn.metrics import accuracy_score, precision_score, recall_score, f1_score

# def model(dbt, session):
#     table_name = dbt.ref('reviews_dbt')

#     df = session.table(table_name).to_pandas()
#     return df

import sys

param1 = sys.argv[1]
param2 = sys.argv[2]

print(f"Parameter 1: {param1}")
print(f"Parameter 2: {param2}")

import os

def model(dbt, session):
    table_name = os.getenv('table_name', 'default_table_name')
    df = session.table(table_name).to_pandas()
    return df
