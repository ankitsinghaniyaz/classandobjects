+++
title = "Set Up MySQL With Rails On Ubuntu 20.04"
description = "Set up Ruby on Rails to work with MySQL on a fresh Ubuntu Linux distribution"
tags = ["rails", "web development"]
keywords = ["install MySQL on ubuntu", "setup MySQL with rails", "MySQL on linux","ruby on rails set up with MySQL"]
date = "2020-05-19T21:33:12+05:30"
categories = ["rails", "web development"]
toc = false
slug = "set_up_ruby_on_rails_with_mysql"
draft = false
+++


I did another post on how every time I install Postgres it's a pain. Jus that you don't think that [MySQL](https://www.mysql.com/) is any easy. I'm noting down my struggles just as I tried setting up another Rails project which used MySQL.

## System Specification
- Ubuntu 20.04
- MySQL 8+ 

NOTE: This is the version of Ubuntu Linux I'm testing it with. Ubuntu is my primary OS. This should work on other Ubuntu versions without any change. Also there's no easy way to install MySQL < 8 in Ubuntu 20.04. It would be easier to switch to Ubuntu 18.04 in case you would want that.

## Installing MySQL
```
sudo apt-get install mysql-server build-essential libmysqlclient-dev
```

## Access MySQL from Rails

#### 1. As the system user when no username and password is provided

```bash
# create a username with the same name as linux user with no password
sudo mysql
CREATE USER '<linux_username>'@'localhost' IDENTIFIED BY '';
GRANT ALL PRIVILEGES ON *.* TO '<linux_username>'@'localhost' WITH GRANT OPTION;
exit
```

#### 2. Create a dedicated user for the application with password

```bash
sudo mysql
CREATE USER '<app_name>'@'localhost' IDENTIFIED BY '<app_name>';
GRANT ALL PRIVILEGES ON *.* TO '<app_name>'@'localhost' WITH GRANT OPTION;
exit
```

Update the `database.yml` file with username and password in the default section or both test and development records

```
username: <app_name>
password: <app_name>
```

## References
1. [How To Install MySQL on Ubuntu 20.04](https://www.digitalocean.com/community/tutorials/how-to-install-mysql-on-ubuntu-20-04)