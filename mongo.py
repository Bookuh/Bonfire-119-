import pandas as pd
import pymongo as pym
import os

def pipeline(filepath):
   df = pd.read_csv(filepath, sep= ";")
   df = df.drop(columns=[
   'address', 'famsize', 'Pstatus', 'Medu', 'Fedu','Mjob', 'Fjob', 'reason', 'guardian', 'traveltime', 'schoolsup', 'famsup', 'paid', 'activities', 'nursery',
   'higher', 'internet', 'romantic', 'famrel', 'freetime', 'goout', 'Dalc',
   'Walc', 'health', 'G1', 'G2'
    ])
   df = df.rename(columns= {'G3': 'final_grade'})

   return df
   
df = pipeline(r"C:\Users\willi\OneDrive\Desktop\Data\Coding Temple Week 5\student-mat.csv")

cleaned_data = df.to_dict()
client = pym.MongoClient(os.getenv('MONGO_URL'))

db = client['StudentGrades']
collection = db['School']
collection.insert_many(cleaned_data)
client.close()

print('Successful Connection')