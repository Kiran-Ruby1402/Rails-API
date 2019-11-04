# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version 2.6.5

* Rails Version 6.0.0

* Clone the application then do "bundle install"

* Configuration

* Database creation((PostgreSQL) 11.5): 1) rails db:create 2)rails db:migrate, 3) rails  s for running the server

* Now, start the server and use cURL to post the credentials to localhost:3000/authenticate. Eg:$ curl -H "Content-Type: application/json" -X POST -d '{"email":"example@mail.com","password":"123123123"}' http://localhost:3000/authenticate_user

================================================ User Registrations  starts ===============================================================
* User Registrations: curl -H "Content-Type: application/json" -X POST -d '{"first_name": "Test", "last_name": "2","email":"test1@mail.com"}' http://localhost:3000/users

* Let's check if the resource is reachable. You can do it by making a GET request: 
	Error: curl -H "Content-Type: application/json" -X GET  http://localhost:3000/users  Response: {"error":"Not Authorized"}
	success:  curl -H "Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE1NzI5NDY0MjB9.Yo4cBUvv2b2AY_WKoCEyM8JnmK_KmzACrjEArHPJjrw" -X GET  http://localhost:3000/users Response: {"status":"success","users":[{"id":1,"email":"example@mail.com","name":" "},{"id":2,"email":"example1@mail.com","name":" "}],"message":"Data received successfully"}


================================================ User Tags Starts==================================================================
* Create Tags: curl -H "Content-Type: application/json" -H "Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE1NzI5NDY0MjB9.Yo4cBUvv2b2AY_WKoCEyM8JnmK_KmzACrjEArHPJjrw"  -X POST -d '{"description": "Test"}' http://localhost:3000/tags

* Tags index: curl -H "Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE1NzI5NDY0MjB9.Yo4cBUvv2b2AY_WKoCEyM8JnmK_KmzACrjEArHPJjrw" -X GET  http://localhost:3000/tags

* Tag Edit:
