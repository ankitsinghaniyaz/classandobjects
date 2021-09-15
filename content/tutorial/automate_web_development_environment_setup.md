+++
title = "How I automated my web development environment setup"
description = "For a web developer clean installing an operating system is a nightmare but it doesn't have to be. I've automated my development environment setup using Ansible and it works"
tags = ["webdev"]
keywords = ["automate web development environment setup", "setup new computer for web development"]
date = "2021-09-15"
categories = ["vue"]
slug = "automate-web-development-environment-setup"
+++

I love linux and before you spend any more time this works only for linux based distros. The ansible script shared below has been tested on on Ubuntu 20.04+, Zorin 15+, POP. It should work with most debian based OS without much change. So let's get started.


My favorite hobby is trying out new operating systems and specially Linux distros. I've always been on a look out for a mature, beautiful and performant distro. Right now [Zorin OS](https://zorin.com/os/) and Ubuntu are my favorite.

Every year or so I've to migrate to a new system and the array of tools that I want has been growing and manually installing it on new OS to experiment is pain. So I've created an Ansible script that does this for me.

```yml
# Set up a development environment on an Ubuntu flavored linux distribution
# install and sets up:
  #  rbenv, nvm, mysql, postgres, redis
  #  vscode, slack, docker, chormium, tilix, heroku, postman, beekeeper, skype, kazam, peek and more
  #  setup an rsa key
# Usage: 
# install ansible 2.7+ - latest
## sudo apt-add-repository ppa:ansible/ansible && sudo apt update && sudo apt install ansible
# run the playbook:
##  ansible-playbook webdev.yaml -K -e "email=<your@email.com>"
---
- hosts: localhost
  tasks:
    - name: ensure dependencies are installed
      become: true
      apt:
        state: latest
        name:
         - git
         - python3-pip 

    - name: install nvm
      git: 
        repo: 'https://github.com/creationix/nvm.git'
        dest: '{{ ansible_env.HOME }}/.nvm'
        update: no

    - name: add nvm to path
      lineinfile:
        dest: '{{ ansible_env.HOME }}/.bashrc'
        line: '{{ item.line }}'
      with_items:
        - { line: 'export NVM_DIR="$HOME/.nvm"' }
        - { line: '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"' }
        - { line: '[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"' }

    - name: install rbenv
      git: 
        repo: 'https://github.com/rbenv/rbenv.git'
        dest: '{{ ansible_env.HOME }}/.rbenv'
        update: no

    - name: add rbenv to path
      lineinfile:
        dest: '{{ ansible_env.HOME }}/.bashrc'
        line: '{{ item.line }}'
      with_items:
        - { line: 'export PATH="$HOME/.rbenv/bin:$PATH"' }
        - { line: 'eval "$(rbenv init -)"' }

    - name: setup ruby builds
      git: 
        repo: 'https://github.com/rbenv/ruby-build.git'
        dest: '{{ ansible_env.HOME }}/.rbenv/plugins/ruby-build'
        update: yes

    - name: install redis
      become: true
      apt:
        name: redis-server
        state: present


    - name: install postgres apt dependencies
      become: yes
      apt:
        pkg:
          - postgresql-contrib
          - libpq-dev

    - name: install postgresql dependencies
      become: yes
      pip:
        name: psycopg2
        state: present
        
    - name: install postgresql
      become: true
      apt:
        pkg: 
          - postgresql

    - name: configure postgres
      become: true
      become_user: postgres
      postgresql_user:
        name: '{{ ansible_env.USER }}'
        role_attr_flags: CREATEDB,NOSUPERUSER

    - name: create default postgres data for user
      postgresql_db:
        name: '{{ ansible_env.USER }}'
        owner: '{{ ansible_env.USER }}'
        login_user: '{{ ansible_env.USER }}'


    - name: generate ssh rsa host key
      command : 'ssh-keygen -q -t rsa -f {{ ansible_env.HOME }}/.ssh/id_rsa -C "{{ email }}" -N ""'
      args:
        creates: '{{ ansible_env.HOME }}/.ssh/id_rsa'

    - name: install docker and compose
      become: true
      apt:
        pkg:
          - docker
          - docker-compose

    # Install some most frequenty needed tools
    - name: install apt packages
      become: true
      apt:
        pkg:
          - tilix
          - redshift
          - kazam
          - vim
          - peek
          - xclip

    - name: install snap classic packages
      become: true
      snap:
        classic: yes
        name: 
          - slack
          - code
          - heroku
          - skype

    - name: install snap packages
      become: true
      snap:
        name: 
          - zoom-client
          - chromium
          - beekeeper-studio
          - postman
          - spotify

    - name: configure aliases
      lineinfile:
        dest: '{{ ansible_env.HOME }}/.bash_aliases'
        line: '{{ item.line }}'
        create: yes
      with_items:
        - { line: 'alias ga="git add"' }
        - { line: 'alias gaa="git add ."' }
        - { line: 'alias gaaa="git add -A"' }
        - { line: 'alias gb="git branch"' }
        - { line: 'alias gbd="git branch -d "' }
        - { line: 'alias gc="git commit"' }
        - { line: 'alias gcm="git commit -m"' }
        - { line: 'alias gco="git checkout"' }
        - { line: 'alias gcob="git checkout -b"' }
        - { line: 'alias gcom="git checkout master"' }
        - { line: 'alias gd="git diff"' }
        - { line: 'alias gda="git diff HEAD"' }
        - { line: 'alias gi="git init"' }
        - { line: 'alias gl="git log"' }
        - { line: 'alias glg="git log --graph --oneline --decorate --all"' }
        - { line: 'alias gld="git log --pretty=format:%h %ad %s --date=short --all"' }
        - { line: 'alias gm="git merge --no-ff"' }
        - { line: 'alias gp="git pull"' }
        - { line: 'alias gss="git status -s"' }
        - { line: 'alias gst="git stash"' }
        - { line: 'alias gstl="git stash list"' }
        - { line: 'alias gstp="git stash pop"' }
        - { line: 'alias gstd="git stash drop"' }
        - { line: 'alias gpsh="git push"' }
        - { line: 'alias alias-edit="vim ~/.bash_aliases"' }
```

## What does it do?

The script is comprised of several steps, I'll list down what all it does in short:

1. Install latest git and python
2. Install NVM and configure
3. Install rbenv and configure
4. Install Redis
5. Install Postgresql and create users
6. Install MySQL and create users
7. Generate SSH keys
8. Install software through apt
    - tilix
    - redshift
    - kazam
    - vim
    - peek
    - xclip
9. Install some more through snap
     - slack
    - code
    - heroku
    - skype
    - zoom-client
    - chromium
    - beekeeper-studio
    - postman
    - spotify
10. And most important setup my git shortcuts


I (try to) keep it up to date in this [gist](https://gist.github.com/ankitsinghaniyaz/a1a1185b3027327502a3d70f6b32271e)