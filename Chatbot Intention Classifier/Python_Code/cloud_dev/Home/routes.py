#Libraries & Packages##################################################
from flask import Blueprint, render_template, redirect, url_for
from flask_login import login_required, current_user
from cloud_dev import db
########################################################################
'''
This modules handles the views for homepage and profile.

This code is adapted to my project following the tutorial.

I confirm that the Source code belongs to:

https://scotch.io/tutorials/authentication-and-authorization-with-flask-login


'''

home = Blueprint('home', __name__,template_folder='templates')

@home.route('/homepage')
def homepage():
    return render_template('home.html')
    #return redirect(url_for('main.chatbot'))
@home.route('/profile')
@login_required
def profile():
    return render_template('profile.html', name=current_user.name)
    #return redirect(url_for('main.chatbot')
    #return render_template('chatbot.html', name=current_user.name)
