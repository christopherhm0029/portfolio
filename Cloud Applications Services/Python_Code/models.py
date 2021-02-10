#This program creates the user database using SQLITE 
#<!-- This template is adapted using the tutorial. I confirm that the sources code belongs to https://scotch.io/tutorials/authentication-and-authorization-with-flask-login-->

from flask_login import UserMixin
from . import db

class User(UserMixin, db.Model):
    id = db.Column(db.Integer, primary_key=True) # primary keys are required by SQLAlchemy
    email = db.Column(db.String(100), unique=True)
    password = db.Column(db.String(100))
    name = db.Column(db.String(1000))