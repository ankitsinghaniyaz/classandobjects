+++
categories = ["python", "djnago", "heroku"]
tags = ["python"]
date = "2016-05-27T11:03:20+05:30"

description = "Step by step guide on how to deploy django application on heroku. This guide talks about creating Procfile, requirement.txt and setting up the toolbelt"

draft = false
slug = "host_django_app_on_heroku"
keywords = "django application, heroku, deploy, host"
title = "Step by Step Guide on Deploying Django Application on Heroku"
toc = false

+++
This guide describe how to deploy Django application on Heroku, gracefully! Yes, you heard it right. Heroku was mostly build with Ruby in mind but now it supports Python applications too. There are some points which are not mentioned in other blogs and [Heroku official docs](https://devcenter.heroku.com/articles/django-app-configuration). I will try to describe all the process in detail here, so that you have a good experience deploying you apps. Lets get started!

## Creating the Project
Creating your project is the most important step in this series. Create your application with default Django settings. These are the few configuration that you will have to do. You can create a Django project using following command:

```bash
django-admin startproject myproject
```
This tutorial talks about configuring Django apps created through above method!

If you are creating a new application I highly recommend using Heroku Django template. You can start your project as:

```bash
django-admin startproject --template=https://github.com/heroku/heroku-django-template/archive/master.zip --name=Procfile  myproject
 ```
 >Note: If you created application using this template you can skip the configuration step.


## Creating Virtual Environment

There are lot of packages in your default python path. You may want to create a fresh and sandboxed environment for this application. This avoids your global changes from affecting this application. Install `virtualenv` with:
```bash
pip install virtualenv
```

You can create the virtual environment with following commands:
```bash
# creates virtualenv with name myenv, feel free to change it
virtualenv myenv

# activate the environment
source myenv/bin/activate
```



## Installing Dependencies

These are few dependencies which are required to successfully deploy your application. Make sure you install them all.

```bash
pip install django
pip install gunicorn
pip install dj-database-url
pip install whitenoise
pip install psycopg2
```

You can get [error while installing psycopg2](http://stackoverflow.com/questions/5420789/how-to-install-psycopg2-with-pip-on-python). I found solution to that on stackoverflow:
```bash
sudo apt-get install libpq-dev python-dev
```

Try again installing `psycopg2`!

You also want to install [Heroku Toolbelt](https://devcenter.heroku.com/articles/getting-started-with-python#set-up) and [git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) for your platform. This helps us easily manage our application remotely.

Try following commands on console to make sure you installed them properly:

```bash
heroku --help
git --help
```

If these commands return with some options, you have successfully installed them.

>**Did You Know?** Heroku uses git to create local repository



## Creating requirements.txt

There is no way for Heroku to know your application dependencies. So we need a `requirements.txt` file in our root at the same level as `manage.py` file.
We can generate the file with following command:

```
pip freeze > requirements.txt
```

>Note: Make sure you create the file parallel to manage.py file.



## Creating Procfile

Create a file called as `Procfile` at same level as your `manage.py` file. Put the following line into it:

```
web: gunicorn myproject.wsgi
```

>Note: Procfile starts with a capital `P`

>Note: Make sure to change myproject.wsgi to yourprojectname.wsgi

This file is used by Heroku to determine what kind of service will be running on the server. It says that "We want a web server gunicorn with the project mentioned"

## Creating runtime.txt

Herkou uses `Python2` as default. If you are like me and want to use `Python3` instead. You can create a file `runtime.txt` in your project root at the same level as `manage.py`

You can find out your python version by firing:
```bash
python -V
```
then put the line in your `runtime.txt` file as:

```
python-3.5.1
```

## Configuring to Deploy

Now you are all set to Configure your Django app for Herkou. There are two files that you need to edit.

### Modify settings.py

Open `settings.py` file, it can be found under your `myproject/myproject/setting.py`. There is only one `settings.py` file in your project. Edit it and the following lines following:

```python
# add this import at top
import dj_database_url

# scroll down to find entries related to DATABASE, below that put following lines
db_from_env = dj_database_url.config(conn_max_age=500)
DATABASES['default'].update(db_from_env)

# scroll down to find entries realted to STATIC, add these lines there
PROJECT_ROOT = os.path.dirname(os.path.abspath(__file__))

STATIC_ROOT = os.path.join(PROJECT_ROOT, 'staticfiles')
STATIC_URL = '/static/'

# Extra places for collectstatic to find static files.
STATICFILES_DIRS = (
    os.path.join(PROJECT_ROOT, 'static'),
)
STATICFILES_STORAGE = 'whitenoise.django.GzipManifestStaticFilesStorage'

# make sure to remove duplicates line if they exist
```

### Modify wsgi.py

Find `wsgi.py` file parallel to `settings.py` file. Edit it and add following lines:
```python
# Add these imports at top
from django.core.wsgi import get_wsgi_application
from whitenoise.django import DjangoWhiteNoise

application = get_wsgi_application()
application = DjangoWhiteNoise(application)
```

## Create .gitignore

Create a git ignore file to avoid adding of unwanted files to our repository. Create a file called `.gitignore` on your project root. Add following lines to it.

```
# name of your environment
venv
# do not allow python cache file
*.pyc
```

Alternatively you can delete the virtual environment `venv` you created!

## Deploy on Heroku

Now you are done with configuring Django application. We are now going to host our application to Heroku. We will use the **herkou toolbelt and git** we installed previously.

Go to [heroku](https://www.heroku.com/) and sign up for an account. Do not forget to verify the email address. Fire in following commands while inside your project root.

```bash
heroku login
# Enter your login id and password you used to create the account

# Set up git flow
git init
git add .

# may have to provide email and name
git config user.email "email@domain.com"
git config user.name "yourname"

git commit -m 'Initial commit'

heroku create
# Creates a new application for this project

git push heroku master
# creates a local repository heroku and starts to host it on heroku

# if above step throws an error you may have to disable static collection and push again using above command
heroku config:set DISABLE_COLLECTSTATIC=1

heroku open
# opens you app on browser

heroku logs
# use this to see how your app is working in case you find some error
```

## Conclusion

I have tried to give all the steps I took to deploy apps to heroku. If you find this article usefull share it with your friends. Feel free to comment about any improvement you would like to see.

>We Learn, We Grow..
