#This program is handling all the process to redirect to webpages
#At the same time executes functions to interact with the Frontend 
from flask import Flask
import boto3
from flask import Blueprint, render_template, request, json, jsonify
from . import db
from .models import User
from flask_login import login_required, current_user, login_user
from .send_sqs import send_inputs
import itertools
from boto3.dynamodb.conditions import Key
main = Blueprint('main', __name__)

dynamodb = boto3.resource('dynamodb')
table = dynamodb.Table('requests')


@main.route('/')
def index():
    return render_template('index.html')


@main.route('/results')
@login_required
def results():

    client = boto3.client('dynamodb')
    response = client.scan(
    TableName = "requests"
    )
    data = dict
    valueString = ''
    valueStringchanged = ''
    valueList = []
    valueListchanged = []
    for item in response['Items']:
        data =  item['original']
        dataChanged = item['modified']
        for x in data.values():
            valueString = x
            valueList += [valueString]
            for y in dataChanged.values():
                valueStringchanged = y
                valueListchanged += [valueStringchanged]
    print(valueList)
    print(valueListchanged)
    total = zip(valueList, valueListchanged)

    return render_template('results.html', total = total)

@main.route('/profile')
@login_required
def profile():
    return render_template('profile.html', name=current_user.name)


@main.route('/profileUser', methods=['POST'])
def profileUser():

    userInput =  request.form['user-value']
    userEdit = request.form['user-modified']

    while (userInput or userEdit) != "":
        if userInput !='':
            print('new value')
            cache = 'test'
            userEdit = ''
            table.put_item(
                Item={
                    "original": userInput,
                    "modified": "N/A",
                }
            )
            
        elif userEdit !='' and userInput == '':
            cacheUpdate = 'test'
            print('input changed--- old value:' + cacheUpdate + 'new value' + userEdit)
            table.put_item(
                Item={
                    "original": "N/A",
                    "modified": userEdit,
                }
            )
        else:
            print('there is some mistake')
        break  

    return json.dumps({'status':'OK','user':userInput, 'modified':userEdit})
