import pandas as pd
from time import time

time = time()

df = pd.DataFrame({'Country':['India','USA','China' ,'Japan'],
'Population':['10000','20000','30000', '40000'],
'time':time})

print(df)
df.to_csv('/app/pop.csv')