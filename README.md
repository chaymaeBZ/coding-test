# coding test

This is an attempt to solve a coding test by dimelo. Here is what it says :

### Subject

Write a Ruby on Rails application that can fetch  mentions  addressed to a twitter user, and allow the user to  reply  to each mention (the reply should be published on twitter).
The application should be structured as follow :
* A page listing the mentions that are stored in the database
* A "fetch" button on this page that should (preferably with ajax) get new
mentions, store them in the database, and refresh the view
* A reply button on each mention to open a reply form
* A live counter in the reply form showing the number of remaining chars relative
to the twitter limit (140)
* It should not be possible to submit the reply form if the reply is longer than the
twitter limit

# Running the app

Create `config/application.yml` and specify the following keys :

* consumer_key
* consumer_secret
* access_token
* access_token_secret

and don't forget to `bundle install`, setting up database and running migrations.

# TODO

Write integration tests

# Enhancements

Move some duplicated code :
* The limit characters in a reply shouldn't be hard coded. Some work can be done here : create a decorator for `Reply` model and set limit characters as we don't want this redurant attribute to appear in every row in database.

# some comments

Maybe you saw a comment in `RepliesController#create` where it talks about *scenario 1.0*. It basically consists of a use case where we want the reply to apear in the **tweets and replies** section of the user twitter account. But this case needs more work and code changes : especially when calculating the number of remaining characters in reply.

