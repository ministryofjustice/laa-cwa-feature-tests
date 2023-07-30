# # theofficefacts.py
# ages = {
#     'pam': 24,
#     'jim': 24,
#     'michael': 43
# }
# print(f'Michael is {ages["michael"]} years old.')



# import cx_Oracle

# connection = cx_Oracle.connect(
#     user="demopython",
#     password="XXXXX",
#     dsn="localhost/xepdb1")

# print("Successfully connected to Oracle Database")

# cursor = connection.cursor()


# test.py

# import oracledb
# import os

# oracledb.init_oracle_client()

# un = os.environ.get('PYTHON_USERNAME')
# pw = os.environ.get('PYTHON_PASSWORD')
# cs = os.environ.get('PYTHON_CONNECTSTRING')

# with oracledb.connect(user=un, password=pw, dsn=cs) as connection:
#     with connection.cursor() as cursor:
#         sql = """select sysdate from dual"""
#         for r in cursor.execute(sql):
#             print(r)




# import cx_Oracle
# import configparser
# import os

#      #using easy connect syntax
# connection = cx_Oracle.connect(
#             user=os.environ.get("PYTHON_USERNAME"),
#             dsn=os.environ.get("PYTHON_CONNECTSTRING"),
#             password=os.environ.get("PYTHON_PASSWORD")
# )
# print("Connection Established")
# self.cursor = connection.cursor()

# def get_cursor(self):
#         return self.cursor


import pandas as pd
import oracledb

oracledb.init_oracle_client(lib_dir="/Users/vimal.suresh/Downloads/instantclient_10_1")

username = 'apps'
password = 'app5cwa'
host = 'localhost:1571/cwa'


conn = oracledb.connect(user=username, password=password, dsn=host)

df = pd.read_sql_query("select table_name from all_tables", conn)
