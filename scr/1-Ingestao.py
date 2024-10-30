import pandas as pd
import sqlalchemy


path = '../data/consulta_cand_complementar_2024/consulta_cand_complementar_2024_BRASIL.csv'

df = pd.read_csv(path,encoding='latin-1',sep=';')

engine = sqlalchemy.create_engine("sqlite:///../data/database.db")

df.to_sql("tb_candidaturas",engine,if_exists='replace',index=False)