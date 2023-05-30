import pandas as pd
from IPython.display import display
from sqlalchemy.types import Integer, Text, String, DateTime, Float

data = pd.read_csv(r'C:\Users\willi\OneDrive\Desktop\Data\Coding Temple Week 5\titanic (1).csv')
# display(data.head())
connection = "postgresql://yyesfgnz:4uoejwmoNhZNgR3b8XXVk_a9W1hjoNBR@rajje.db.elephantsql.com/yyesfgnz"
data.to_sql('Ship', con = connection)
display(pd.read_sql_table('Ship', con = connection))