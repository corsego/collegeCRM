Authentication and Authorization Ruby on Rails app boilerplate 

Stack:

* Rails 6.1 +
* Ruby 2.7.2 + 
* Postgresql

# Core featuers:

## Authentication

* Log in with email
* Log in with Google
* Log in with Facebook
* Log in with Twitter
* Log in with Github
* Invisible Recaptcha
* Email address confirmations
* Users can be invited, banned, unbanned, deleted

## Authorization

* User roles
* Role-based access to different features
* Admin can edit user roles

## Connected services:

* Google oAuth API
* Facebook oAuth API
* Twitter oAuth API
* Github oAuth API
* Amazon SES emails API

# Installation

console:
```
git clone https://github.com/corsego/collegeCRM
cd collegeCRM
bundle
yarn
rails db:create db:migrate
```

Update your `credentials.yml` file

[Howto guide](https://blog.corsego.com/ruby-on-rails-6-credentials-tldr)

credentials.yml example:
```
development:
  github:
    id: YOUR_CLIENT_ID
    secret: YOUR_CLIENT_SECRET
production:
  github:
    id: YOUR_CLIENT_ID
    secret: YOUR_CLIENT_SECRET

google_oauth2:
  id: YOUR_CLIENT_ID
  secret: YOUR_CLIENT_SECRET

facebook:
  id: YOUR_CLIENT_ID
  secret: YOUR_CLIENT_SECRET

twitter:
  id: YOUR_CLIENT_ID
  secret: YOUR_CLIENT_SECRET

smtp:
  address: email-smtp.eu-central-1.amazonaws.com
  user_name: YOUR_CLIENT_ID
  password: YOUR_CLIENT_SECRET
```
