AndroidCamp.in
==============

talk proposal website for androidcamp.

How to get this up and running on your computer
------------------------------------------------

The site is a rails (v3.0.5) app. You'll need ruby 1.9.2 (for good) and rubygems. The following *getting-started* assumes you have the requirements. Here are steps on how to get a version of the site running on your computer:

* clone this repo
* Install the bundler gem
     $ gem install bundler --no-ri --no-rdoc
* Install all the dependencies by using bundler
     $ bundle install
* Migrate the database (it'll use sqlite by default)
     $ rake db:migrate
* To start the development server
     $ rails s

__Some info for you hackers__

* Stylesheets are in sass at app/stylesheets. The stylesheets use semantic blueprint with 24 columns (all blueprint is in the sass instead of the views). When you run the rails development server, compass does the job of compiling the stylesheets auto-magically. So just keep edit them and refresh the page in your browser to see your results.

* talks/popular is the root_url.

How to contribute
-----------------

* Fork this repo.
* create your own branch on your repo.
* commit your changes and push to your repo.
* send pull request

TODO
-----

* Style pages. The current design is very minimal.
* If you have any features in mind, go ahead fork and contribute.
