#function to submit a new message to AWS using SQS and Lambda 
import boto3

sqs = boto3.client('sqs')

queue_url = 'https://sqs.eu-west-1.amazonaws.com/085869636677/sqs_to_lambda'

class send_inputs():
    
    def send_to_aws(self,input):
        
        self.input = input
        response = sqs.send_message(
        QueueUrl=queue_url,
        DelaySeconds=10,
        MessageBody=(
        self.input
        )
        )
        print(response['MessageId'])
        return 'message sent'

# valores = 'hola como estas'
# a = send_inputs()
# b = a.send_to_aws(valores)
# print(b)