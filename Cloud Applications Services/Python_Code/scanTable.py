#This code is a function to query all the data in the Database using Boto3 AWS programatically library
# import boto3

# from boto3.dynamodb.conditions import Key, Attr
# dynamodb = boto3.resource('dynamodb')
# table = dynamodb.Table('requests')

# response = table.scan(
#     FilterExpression=Attr('original')&
# )
# for x in response["Items"]:
#     print(x)


import boto3
from boto3.dynamodb.conditions import Key

# dynamodb = boto3.resource('dynamodb')
# test_table = dynamodb.Table('requests')

# # Give me all items where primary key "column1" = "fruit1"
# response = test_table.query(KeyConditionExpression=Key('original').eq(' '))

# for item in response['Items']:

#     print(item['modified'])
client = boto3.client('dynamodb')
response = client.scan(
  TableName = "requests"
  )
data = dict
values = ''
together = []
extra = ''
zeta = []
for item in response['Items']:
     data =  item['original']
     data2 = item['modified']
     for x in data.values():
         values = x
         together += [values]
         for y in data2.values():
             extra = y
             zeta += [extra]
print(together)
print(zeta)



#         print(values(item))
# for x in response.values():
#     print(x)

# thisdict =	{
#   "brand": "Ford",
#   "model": "Mustang",
#   "year": 1964
# }
# for x in thisdict.values():
#   print(x)


#    print(item['original'])