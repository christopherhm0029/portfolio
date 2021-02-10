
import psutil
import boto3
import datetime as dt
import requests
from pyspectator.processor import Cpu
from time import sleep
import subprocess

cpu = Cpu(monitoring_latency=1)

CPU_entity = str

def monitoring():
    
    dynamodb = boto3.resource('dynamodb')
    dynamoTable = dynamodb.Table('Node_A')
    global CPU_entity

    counter_severity = 0

    alfa = 1

    with cpu:

        while True:
            cpu_metrics = []
            for x in range(10):

                cpu_tracking = int (round(cpu.load))
                cpu_metrics += [cpu_tracking]
                sleep(1)
        
                if x == 9:
                    
                    if alfa == 1:

                        synchronize_timer(10)
                        alfa = 0

                    else:

                        cpu_average = round(sum(cpu_metrics)/10)
                
                        filter_NlU_IP= "http://54.155.89.119:5000/"

                        CPU_analysis = requests.get(filter_NlU_IP + str(cpu_average) + "%")

                        CPU_class = CPU_analysis.json()
                        CPU_class_level = CPU_class['slots'][0]
                        CPU_entity = CPU_class_level['entity']
                    
                        now = dt.datetime.now()
                
                        dynamoTable.put_item(

                            Item={
                                "Date" : now.strftime("%Y-%m-%d"),
                                "Time" : now.strftime("%H:%M:%S"),
                                "CPU": str(cpu_average) + "%",
                                "CPU_Status": CPU_entity
                            }
                        )

                        severity_mode = indirect(CPU_entity)
                        analysis(severity_mode)



def analysis(x):
    dynamodb = boto3.resource('dynamodb')
    dynamoTable = dynamodb.Table('Analysis_Node_A')
    now = dt.datetime.now()
    dynamoTable.put_item(

        Item={
            "Date" : now.strftime("%Y-%m-%d"),
            "Time" : now.strftime("%H:%M:%S"),
            "Severity_Mode": x
        }
    )
    return None


def synchronize_timer(x):

    dynamodb = boto3.resource('dynamodb')
    dynamoTable = dynamodb.Table('Synchronize')
    now = dt.datetime.now()
    dynamoTable.put_item(

        Item={
            "Date" : now.strftime("%Y-%m-%d"),
            "Time" : now.strftime("%H:%M:%S"),
            "Frequency": x
        }
    )
    return None


def low():
    return "ignore"

def wait():
    return 'wait'

def proceed():
    return 'proceed'

def indirect(i):
    switcher={
        "low":low,
        "moderate":low,
        "moderate_high" :wait,
        "high":proceed,
        "critical":proceed
        }
    func=switcher.get(i,lambda :'Invalid')
    return func()




monitoring()

