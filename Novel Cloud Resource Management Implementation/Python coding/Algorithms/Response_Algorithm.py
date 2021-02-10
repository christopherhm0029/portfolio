import boto3
from boto3.dynamodb.conditions import Key
from time import sleep
import datetime as dt
import subprocess

DB = boto3.resource("dynamodb")
table = DB.Table("Analysis_Node_A")



def delete_DB():
    response = table.scan()
    with table.batch_writer() as batch:

        for each in response['Items']:

            batch.delete_item(
                Key={
                    'Date': each['Date'],
                    'Time': each['Time']
                }
            )


def get_value(x):

    data_observed = x[0]

    new_state = data_observed['Severity_Mode']

    if new_state == 0:

        return 0
    
    else:

        return new_state


def autoscaling_tracking(x, y, z, w):
    dynamodb = boto3.resource('dynamodb')
    dynamoTable = dynamodb.Table('Decision_Nodes_A_B')
    now = dt.datetime.now()
    dynamoTable.put_item(

        Item={
            "Date" : now.strftime("%Y-%m-%d"),
            "Time" : now.strftime("%H:%M:%S"),
            "Created_EC2_ID": x,
            "Severity_Modes": y,
            "Decision": z,
            "Time_decision_taken": w
        }
    )
    return None



def create_instance():

    EC2_ID_autoscaling = " "

    ec2 = boto3.resource('ec2')
    instance = ec2.create_instances(
        BlockDeviceMappings=[
            {
                'DeviceName': '/dev/xvda',
                'Ebs': {
                
                    'DeleteOnTermination': True,
                    'VolumeSize': 8,
                    'VolumeType': 'gp2'
                },
            },
        ],
        ImageId = 'ami-05f9556fa72b6ad3e',
        MinCount = 1,
        MaxCount = 1,
        InstanceType = 't2.micro',
        Monitoring={
            'Enabled': False
        },
        KeyName = 'libraries',
        SecurityGroupIds=[
            'sg-0a214a602eaf69347',
        ],
    )    
    EC2_ID_autoscaling = instance[0].id

    return EC2_ID_autoscaling


def delete_EC2_autoscaling(x):

    ec2 = boto3.resource('ec2')
    id = x
    instance = ec2.Instance(id)
    print(instance.terminate())


def get_frequency():
    DB = boto3.resource("dynamodb")
    table = DB.Table("Synchronize")
    response = table.scan()

    if (len(response['Items'])) == 1:
        x = 10
    else:
        x = 0
    return x

def switch_func(value, x):
    return {
        'proceed': lambda x: 2 if x == 4 else 1 if x ==3 else 0,
        'wait': lambda x: 1 if x >= 3 else 0
    }.get(value)(x)



def actions():

    
    new_counter_time= 0

    list_severity_modes = []

    instance_created_counter = 0

    created_instance_ID = " "

    previous_state = 0

    combine = 0

    list_new_instance = []
    # response = table.scan()

    alfa = 0

    while alfa < 1:

        alfa = get_frequency()

    while True:

        sleep(9)

        response = table.scan()

        if  (len(response['Items'])) == 1:

            new_counter_time += 1

            dataset = response.get('Items')

            analysis = get_value(dataset)

            list_severity_modes += [analysis]

            delete_DB()

            if previous_state == 2 and new_counter_time ==1:

                previous_state = 0
                new_counter_time = 0
                wait = list_severity_modes.count("wait")
                proceed = list_severity_modes.count("proceed")
                combine = wait + proceed

                if combine == 1 and instance_created_counter <= 1:

                    combine = 0
                    created_instance_ID = create_instance()
                    b = "previous metrics performance + 2 new metrics performance"
                    autoscaling_tracking(created_instance_ID, b, "Creating Instance", "50 seconds")
                    list_severity_modes = []
                    b = ""
                    instance_created_counter += 1
                    list_new_instance += [created_instance_ID]

                else: 
                    list_severity_modes = []


            elif previous_state == 1 and new_counter_time == 2:

                previous_state = 0
                new_counter_time = 0
                wait = list_severity_modes.count("wait")
                proceed = list_severity_modes.count("proceed")
                combine = wait+proceed
                list_severity_modes = []
                if 2 == combine and instance_created_counter <= 1:

                    combine = 0
                    new_counter_time = 0
                    created_instance_ID = create_instance()
                    b = "previous metrics performance + 2 new metrics performance"
                    autoscaling_tracking(created_instance_ID, b, "Creating Instance", "60 seconds")
                    b = ""
                    instance_created_counter += 1
                    list_new_instance += [created_instance_ID]
                
                else: 
                    pass

            elif previous_state == -1 and new_counter_time == 2 and instance_created_counter <= 2:
                
                previous_state = 0
                new_counter_time = 0
                ignore = list_severity_modes.count("ignore")
                list_severity_modes = []
                if 2 == ignore:
                    

                    if (len(list_new_instance)) == 1:
                        value = list_new_instance[0]    
                        delete_EC2_autoscaling(value)
                        b = "previous metrics performance + 2 new metrics performance"
                        autoscaling_tracking(value, b, "Deleting Instance", "60 seconds")
                        list_new_instance.remove(value)
                        value = ""
                        b = ""
                        instance_created_counter = 0

                    elif (len(list_new_instance)) == 2:
                        value = list_new_instance[0]
                        delete_EC2_autoscaling(value)
                        b = "previous metrics performance + 2 new metrics performance"
                        autoscaling_tracking(value, b, "Deleting Instance", "60 seconds")
                        list_new_instance.remove(value)
                        b = ""
                        value = ""
                        instance_created_counter = 1
                    else:
                        pass

            elif new_counter_time == 4:

                new_counter_time = 0
                ignore = list_severity_modes.count("ignore")
                wait = list_severity_modes.count("wait")
                proceed = list_severity_modes.count("proceed")
                if ignore <= 1:

                    wait_analysis = switch_func("wait", wait)
                    proceed_analysis = switch_func("proceed", proceed)

                    if proceed_analysis == 2 and instance_created_counter <= 1 :

                        created_instance_ID = create_instance()
                        autoscaling_tracking(created_instance_ID, list_severity_modes, "Creating Instance", "40 seconds")
                        list_severity_modes = []
                        instance_created_counter += 1
                        list_new_instance += [created_instance_ID]
                    
                    elif proceed_analysis == 1:

                        previous_state = 2
                        list_severity_modes = []

                    elif wait_analysis == 1:

                        previous_state = 1
                        list_severity_modes = []
                    else:

                        previous_state = 0
                        list_severity_modes = []

                elif ignore == 3:
                    previous_state = -1
                    list_severity_modes = []

                elif ignore == 4:

                    if (len(list_new_instance)) == 1:
                        value = list_new_instance[0]    
                        delete_EC2_autoscaling(value)
                        autoscaling_tracking(value, list_severity_modes, "Deleting Instance", "40 seconds")
                        list_new_instance.remove(value)
                        list_severity_modes = []
                        value = ""
                        instance_created_counter = 0
                    
                    elif (len(list_new_instance)) == 2:
                        value = list_new_instance[0]
                        delete_EC2_autoscaling(value)
                        autoscaling_tracking(value, list_severity_modes, "Deleting Instance", "40 seconds")
                        list_new_instance.remove(value)
                        list_severity_modes = []
                        value = ""
                        instance_created_counter = 1

                else:
                    list_severity_modes = []
                    previous_state = 0
            
            else:
                print("hola")

        else:
            delete_DB()
            print("waiting")
                

actions()