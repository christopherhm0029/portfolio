# Libraries & Packages##################################################################
from flask_login import UserMixin
from cloud_dev import db
########################################################################################
'''
This modules handles the creation of the db model.

This code is adapted to my project following the tutorial.

I confirm that the Source code belongs to:

https://scotch.io/tutorials/authentication-and-authorization-with-flask-login


'''

class User(UserMixin,db.Model):
    id = db.Column(db.Integer, primary_key=True) # primary keys are required by SQLAlchemy
    email = db.Column(db.String(100), unique=True)
    password = db.Column(db.String(100))
    name = db.Column(db.String(10))