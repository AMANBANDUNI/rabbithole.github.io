An e-commerce web site built with rails framework and for front-end haml used with bootstrap. From beginning i created this project with this command line ( yarn & node should be installed in your system):

rails new ecom rails --skip-active-record

Add mongoid gem in gemfile
gem 'mongoid', '~> 7.2'
gem 'bson_ext'

then bundle install

Then create mongoid config file for mongodb database configuration
rails generate mongoid:config

