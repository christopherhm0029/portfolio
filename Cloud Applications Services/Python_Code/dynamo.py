import json
import boto3

def lambda_handler(event, context):
    data = json.loads(event["Records"][0]["body"])
    Body = json.dumps(data)
    dynamodb = boto3.resource('dynamodb')
    dynamoTable = dynamodb.Table('inputs')
    dynamoTable.put_item(
        
        Item={
        
        "Normal" : Body    
            
        }

        
    )
    
    
    # TODO implement
    return {
        'statusCode': 200,
        'body': json.dumps('Hello from Lambda!')
    }

