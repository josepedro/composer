## AART

### Reference Application


### Install Codebase

Clone the git repository

    $ git clone git@github.com:thoughtbot/paperclip_demo.git
    $ cd paperclip_demo
    $ bundle

Create database and run migrations

    $ rake db:create db:migrate

Run the rails server

    $ rails s

### View Application

From a web browser access the site via [localhost:3000](http://localhost:3000)

## Deploy the application to Heroku

Create an application container on Heroku

    $ heroku create

Push the code to the Heroku container

    $ git push heroku master

Run any database migrations

    $ heroku rake db:migrate

Set the AWS S3 config vars

    $ heroku config:add AWS_BUCKET=your_bucket_name
    $ heroku config:add AWS_ACCESS_KEY_ID=your_access_key_id
    $ heroku config:add AWS_SECRET_ACCESS_KEY=your_secret_access_key
    
Now view your Heroku application

    $ heroku open


Trail Map is licensed under the [Creative Commons Attribution License](http://creativecommons.org/licenses/by/3.0/).
