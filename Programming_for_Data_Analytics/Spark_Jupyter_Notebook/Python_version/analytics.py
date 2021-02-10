###                Libraries                 ####

from pymongo import MongoClient
import numpy as np 
import pandas as pd
from pandas import DataFrame
from pyspark.sql import SparkSession,SQLContext
from pyspark import sql, SparkConf
import mysql.connector
from sqlalchemy import types, create_engine
import pymysql

#################################################

###             Mongodb  CONFIGURATION         ####
# client= MongoClient('mongodb://localhost:27017/') Error file too big for the machine to handle

# db = client.test #Databa name

# collection_1  = db.students # Raw students dataset

# db_students =  pd.DataFrame(list(collection_1.find())).drop(columns=['_id'])

# collection_2 = db.master_dataset # Raw master_dataset # Too big to handle low memory error kernel killed #

# db_master = pd.DataFrame(list(collection_2.find())).drop(columns=['_id'])

# collection_3 = db.workers_dataset

# db_workers = pd.DataFrame(list(collection_3.find())).drop(columns=['_id'])

####################################################

###     MYSQL DATABASE CONFIGURATION           ####

MYSQL_USER     = 'root'
MYSQL_PASSWORD = 'P455w0rd.'
MYSQL_HOST_IP  = '127.0.0.1'
MYSQL_PORT     = '3306'
MYSQL_DATABASE = 'master_europe'

engine = create_engine('mysql+mysqlconnector://'+MYSQL_USER+':'+MYSQL_PASSWORD+'@'+MYSQL_HOST_IP+':'+MYSQL_PORT+'/'+MYSQL_DATABASE, echo=False)

###         Local loading the raw datasets      ####

db_master = pd.read_csv("/home/chris/Desktop/DataAnalytics/master_dataset.csv",sep=',', error_bad_lines=False, index_col=False, dtype='unicode')

db_student = pd.read_csv("/home/chris/Desktop/DataAnalytics/students.csv",sep=',', error_bad_lines=False, index_col=False, dtype='unicode')

db_workers = pd.read_csv("/home/chris/Desktop/DataAnalytics/workers.csv",sep=',', error_bad_lines=False, index_col=False, dtype='unicode')

####################################################

### Renaming and cleaning inadequate variables values #####

db_workers = db_workers.rename(columns=lambda x: x.replace('Clean_', '').lower())

db_student = db_student.rename(columns=lambda x: x.replace('Clean', '').lower())

db_student['costschool'] = db_student.costschool.str.replace('�','')

db_student = db_student.drop(columns="uni+ag:bhtcount")

#####################################################

###             Changing variables type object (str) to float64  amd filtering sections ######


db_student_cost_mod = (db_student['costschool'].str.replace(",","")
                                                    .fillna(0)
                                                    .astype(float))

new_value = db_student_cost_mod.to_frame().reset_index(drop=True)

db_student['costschool'] = new_value


db_student_home_mod = (db_student['homeshare'].str.replace("Unknown","0")
                                                    .astype(int))

new_value2 = db_student_home_mod.to_frame().reset_index(drop=True)

db_student['homeshare'] = new_value2

db_student_room_mod = (db_student['roomshare'].str.replace("NaN","0")
                                                   .fillna(0)
                                                   .astype(int))

new_value3 = db_student_room_mod.to_frame().reset_index(drop=True)

db_student['roomshare'] = new_value3

########################################################


###       Mapreduce pattern mapping and reducing key:value ####

countries = db_student.groupby(['country']).groups.keys() # Key = Countries 

list_country = list(countries)

my_dict = {} # Dictionary total number of students per country

for x in range(0,len(list_country)): # iterate through the total number of countries
    
    counter = 0
    
    for i in range(0,len(db_student.iloc[:,0])): # iterate through all the rows per Country
        
        value = list_country[x]

        if i < 1077: # 1077 total number of row values
            
            if value == (db_student['country'].iloc[i]): # 
                
                counter = counter + 1 # count the number of students per country
            
        elif i == 1077: #1077  

            my_dict.__setitem__(value,counter) #updating the dictionary Key:Value = Country: Total_number_of_students

            #my_dict
                
        else:
            pass

################################################################################
# Simpler version of above

# db_student_population = db_student.groupby('country').size().reset_index(name='count')

#################################################################################

### Creating new dataframe to analyze the student population base on Country ####

db_student_country =pd.DataFrame(list(my_dict.items()),columns = ['country','total']) 

db_student_country = db_student_country.sort_values(by='total', ascending=False)

db_student_country = db_student_country.reset_index(drop=True)

##################################################################################

###        Mapping and reducing Key:Value Countries:total_cost_school           ####

###         MapReduce pattern summarization 

db_student_cost_school = db_student.groupby(['country'], as_index=False)['costschool'].sum()

db_student_schoolCost = db_student_cost_school.sort_values(by='costschool', ascending=False).reset_index(drop=True)

##################################################################################

###         Design pattern Join Full Outer Join of Country + School cost on Country ID 
# 
#           Merge key indicator in both dataframes 

table_student_cost_edu = pd.merge(db_country, db_student_schoolCost,how='outer', on='country',indicator=True)

###             Sending the Dataframe to MYSQL DATABASE             #####

table_student_cost_edu.to_sql("table_student_cost_edu", engine, if_exists="replace", index=False)

##################################################################################

####        Table Students Homesharing number per Country            #####

table_student_homesharing = db_student.groupby('country')['homeshare'].value_counts().unstack().fillna(0) 

table_student_homesharing.to_sql("table_student_homesharing", engine, if_exists="replace", index=False)

###################################################################################

####        Table Students Roomsharing number per Country             #####

table_student_roomsharing = db_student.groupby('country')['roomshare'].value_counts().unstack().fillna(0)

table_student_roomsharing.to_sql("table_student_roomsharing", engine, if_exists="replace", index=False)

#####################################################################################

### Worker Raw Dataset cleaning and analysis proccess  #####

db_workers_cost_edu = (db_workers['cost_education'].str.replace("NaN","0")
                                                   .fillna(0)
                                                   .astype(float))

new_value4 = db_workers_cost_edu.to_frame().reset_index(drop=True).round(decimals=2)


db_workers['cost_education'] = new_value4



#######################################################################################

### Table visualization Total cost of education based on Countries  ######

table_workers_cost_edu = db_workers.groupby(['country'], as_index=False)['cost_education'].sum()

db_workers_population = db_workers.groupby('country').size().reset_index(name='count')

table_workers_cost_edu.to_sql("table_workers_cost_edu", engine, if_exists="replace", index=False)

#######################################################################################

###          Table Mental Health Students per Country               #######

table_workers_mental_health = db_workers.groupby('country')['mental_health_household'].value_counts().unstack().fillna(0)

table_workers_mental_health.to_sql("table_workers_mental_health", engine, if_exists="replace", index=False)

#########################################################################################

###           Table English Student Level per Country                ########

table_english_level = db_workers.groupby('country')['english_level'].value_counts().unstack().fillna(0)

table_english_level.to_sql("table_english_level", engine, if_exists="replace", index=False)

#########################################################################################

###            Table Satisfaction towards Enlighs Online Courses      ########

table_satisfaction_courses = db_workers.groupby('country')['satisfied_online_courses'].value_counts().unstack().fillna(0)

table_satisfaction_courses.to_sql("table_satisfaction_courses", engine, if_exists="replace", index=False)

##########################################################################################

###         Third part Master_dataset                                               #####

#####       Filtering database by region                                            #####

europe_region = db_master.groupby("region") 

db_europe = europe_region.get_group("EU")

db_europe_ie = db_europe.groupby('country')

db_ie = db_europe_ie.get_group('IE')

table_ie_covid19 = db_ie

db_ie.to_sql("table_ie_covid19", engine, if_exists="replace", index=False)

db_ie.groupby('sex')['age'].value_counts().unstack().fillna(0)

###########################################################################################