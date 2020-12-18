# Rails Engine

##Project Members:
* Hope Gochnour | [GitHub](github.com/hopesgit) | [LinkedIn](https://www.linkedin.com/in/hope-gochnour-3056aa1ba/)

## What is this?

Rails Engine is a WebAPI project that displays sales data stored in this app, that is accessed by calling the API.

## Versions
* Ruby version: 2.5.3
* Rails ver. 5.2.4.4

## Configuration
Fork and clone this repo if you'd like to play around!
As you may be used to, run:
```bundle```
```rails db:{create,migrate,seed}```
to get started!

## Deployment
This repo is hosted on [Heroku](https://hope-rails-engine.herokuapp.com/). You can call the api using the heroku link above (```hope-rails-engine.herokuapp.com/```) + the routes below to call this API!

## Routes
* note: this API does not use keys; please be kind about your calls!
* Usage:
  * Merchants:
    * path: get "/api/v1/merchants"
      * Returns list of 20 merchants by default
      * Options: limit={number}"
    * path: get "/api/v1/merchants/{id}"
      * Returns details for a single merchant based on id provided
    * path: post "/api/v1/merchants?name={name}"
      * Creates a new merchant using that name and reports the new object
    * path: patch "/api/v1/merchants/{id}"
      * Include the field you want to change in the body of your request, like this: ```{ "attribute_name": "new_attribute_value" }```
    * path: delete "/api/v1/merchants/{id}"
      * Deletes the Merchant referenced by the ID given.
    * path: get "/api/v1/merchants/find"
      * options: ```name=<blah>```
