import pandas as pd
import sqlalchemy
import json

engine = sqlalchemy.create_engine("sqlite:///../data/database1.db")

with open('ingestoes.json','r') as arquivo:
    ingestoes = json.load(arquivo)

for i in ingestoes:
    path=i['path']
    df = pd.read_csv(path,encoding='latin-1',sep=';')

    df.to_sql(i['table'],engine,if_exists='replace',index=False)