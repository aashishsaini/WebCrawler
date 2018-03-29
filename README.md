README
------
A tiny RESTful Json API to index a page's content.
"Index the content" means to parse the page content and store its content 
- in this case to store the content that is found inside the tags h1, h2 and h3 and the links.

The API have two endpoints:

1. The former receives a url, indexes the content and stores it in the database.
   Content includes only header tags (H1, H2 and H3) and links urls.

  POST /v1/pages pages#create

2. The other endpoint lists previously stored urls

  GET /v1/pages pages#index


Dependencies
------------

Before setup the application, you need to install:

- The Ruby language (version 2.2)
- Rails (versions 4.2)
- PostgreSQL
- rvm

Check that appropriate versions of Ruby and Rails are installed in your development environment:
`$ ruby -v`
`$ rails -v`

Configuration
-------------

clone this response

`git clone ....`

Switch to the application directory to examine and test what you’ve built.

`$ rvm install 2.2.5`

`$ cd WebC  rawler`

`$ gem install bundler`

`$ bundle install`


Database creation
-----------------

`$ rake db:create`

Database initialization
-----------------------

```
# Run migrations
rake db:migrate
```

Start the Web Server
--------------------

Run the app by entering the command:
```
$ rails server
```

To see your application in action, please refer to API Documentation and browse the generated docs

API Documentation
-----------------

Generate the docs!

```
$ rake docs:generate
```

Browse docs

```
http://localhost:3000/v1/api/docs
```


How to test the end points of api
-------------------------

- use insomnia 'an api testing tool'
- use curl
    - for POST 
        - run `curl -i -H "Accept: application/vnd.api+json" -H 'Content-Type:application/vnd.api+json' -X POST -d '{"data": {"type":"pages", "attributes":{"url":"http://localhost:3002/500.html"}}}' http://localhost:3002/v1/pages`
    - for GET 
        - run `curl -i -H "Accept: application/vnd.api+json" "http://localhost:3002/v1/pages"`

How to run the test suite
-------------------------
The application contain a suite of RSpec tests.
Run `rspec -fd` to run all RSpec tests.

Please send the author a message, create an issue, or submit a pull request if you want to contribute improved RSpec tests.

Deployment instructions
-----------------------

For easy deployment, use a “platform as a service” provider such as:

- [Heroku](http://www.heroku.com/)
- [CloudFoundry](http://www.cloudfoundry.com/)
- [EngineYard](http://www.engineyard.com/)
- [OpenShift](https://openshift.redhat.com/app/)

For deployment on Heroku, see the article:

- [Rails on Heroku](http://railsapps.github.io/rails-heroku-tutorial.html)
