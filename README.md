# Rails Engine

## What is this?

Rails Engine is a WebAPI project that displays sales data stored in this app, that is accessed by calling the API.

## Versions
* Ruby version: 2.5.3

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* Usage:
  * Merchants:
    * path: get "/api/v1/merchants"
      * Returns list of 20 merchants by default
      * Options: limit={number}"
    * path: get "/api/v1/merchants/{id}"
      * Returns details for a single merchant based on id provided
    * path: post "/api/v1/merchants?name={name}"
      * Creates a new merchant using that name and reports the new object
