# Installation Instructions 
To get the coding-challenge-starter-project setup on your local development machine, please perform the following steps:

## Unzip and push project to private Github repo
Make sure to unzip the project folder and push to a private github repository.

## Ensure Ruby is installed
Make sure you are running the relevant ruby version required for the Gemfile in the rails project.
```ruby
ruby -v
```
should return the same ruby version as specified in the `Gemfile`.

## Ensure your Postgres Database is setup
```SQL
CREATE DATABASE local_database_name;
```

Also make sure to update the `.env` file with the appropriate environment variables.

```bash
DB_USERNAME='YOUR_USERNAME_HERE'
DB_PASSWORD=''
DB_HOSTNAME='localhost'
DB_DATABASE='local_database_name'
```

## Install the Gem depedencies
Run `bundle install` to ensure your project has all the relevant 3rd party packages installed on your machine.

You may need to run `gem install rails` if this is the first time using rails on your machine.

## Run database migrations on the database
To get the tables setup run `rake db:migrate`. This will create all the required database tables for the app.

## Import the json data into the database
To import the `naisc.json` and `companies.json` data into your database, run the following (in this order):

```ruby
rake import:naisc
```

```ruby
rake import:companies
```

If you accidentall imported the data twice, you can run `rake db:reset db:migrate` before re-importing the data.

## Run the Rails server
To get the project up and running, you will need to run the rails server:
```ruby
rails s
```

You should be able to view the project on your local development machine at `localhost:3000`. Make sure no other process is running on the same port if you get an already in use error.

## NPM / Yarn Packages
You should use the `yarn add package-name-here` command to add frontend dependencies for this project.

To auto-compile the frontend assets within rails, in a separate terminal tab, you can run

```bash
bin/webpack-dev-server
```
