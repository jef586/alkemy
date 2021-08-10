# README

## Project

Somos más

## Install

### Clone the repository

> git clone git@bitbucket.org:alkemy-dev/t59-project.git

## Check your Ruby version

> ruby -v

The output should start with something like > ruby 2.7.0

## Install dependencies

Using Bundler

> bundle install

## Initialize the database

> rails db:drop db:create db:migrate db:seed

## Seed

### Users instances

This part of seed create ten users with administrator role and ten users with client role to 
test authentication and authorization.

### Activities instances

This part of seed take real activities from the project with the purpose to populate the database.

### News instances 

This part of seed create an user with administrator role and ten news to test the endpoints of the News
controller.