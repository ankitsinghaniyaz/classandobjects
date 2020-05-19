+++
title = "Set Up Postgres With Rails On Ubuntu 20.04"
description = "Set up ruby on rails to work with postgres on a fresh Ubuntu Linux distribution"
tags = ["rails", "web development"]
keywords = ["install postgresql on ubuntu", "setup postgres with rails", "postgres on linux","ruby on rails set up with postgres"]
date = "2020-05-19T21:33:12+05:30"
categories = ["rails", "web development"]
toc = false
slug = "set_up_ruby_on_rails_with_postgres"
draft = false
+++


This is no beginner stuff! Every time I have to do a fresh install of [Postgresql](https://www.postgresql.org/) and make it work with [Ruby on Rails](https://rubyonrails.org/). It is a pain in the ass. I made up my mind that this is going to be the last time I will have trouble doing this. So here we go with every minute details.

## System Specification
Ubuntu 20.04
Postgres 12+
NOTE: This is the version of Ubuntu Linux I'm testing it with. Ubuntu is my primary OS. This should work on other Ubuntu versions without any change. 

## Installing Postgres
```
sudo apt-get install postgresql postgresql-contrib libpq-dev
```

## Two ways to access Postgres from Rails

#### 1. As the system user when no username and password is provided

```
# create a username with the same name as linux user with no password
sudo -u postgres psql
create role <linux_user_name> with createdb login password '';
```

#### 2. Create a dedicated user for the application with password

```
# start Postgres interactive shell
sudo -i -u postgres psql
create role <app_name> with createdb login password '<app_name>';
```

Update the `database.yml` file with username and password in the default section or both test and development records

```
username: <app_name>
password: <app_name>
```

## References
1. [How To Install and Use PostgreSQL on Ubuntu 18.04](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-postgresql-on-ubuntu-18-04)
2. [How To Set Up Ruby on Rails with Postgres](https://www.digitalocean.com/community/tutorials/how-to-set-up-ruby-on-rails-with-postgres)
3. [PostgreSQL gem pg was unable to install](https://stackoverflow.com/questions/13702417/postgresql-gem-pg-was-unable-to-install)