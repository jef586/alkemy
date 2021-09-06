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

### Members instances

This part of seed create ten members with all information nedeed to test the endpoints of the Members controller.

### Posts instances 

This part of seed create an user with administrator role and ten posts to test the endpoints of the Posts controller.

### Commentaries instances

This part of seed create an user and ten commentaries with the purpose to test the endpoint of the Commentary controller.
# alkemy
