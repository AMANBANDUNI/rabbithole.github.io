# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...



An e-commerce web site built with rails framework and for front-end haml used with bootstrap. From beginning i created this project with this command line ( yarn & node should be installed in your system):

rails new offrule rails --skip-active-record

Add mongoid gem in gemfile
gem 'mongoid', '~> 7.2'
gem 'bson_ext'

then bundle install

Then create mongoid config file for mongodb database configuration
rails generate mongoid:config


<!-- create home controller and root route -->
rails generate controller Home


<!-- Got this after adding devise gem and bundle i -->
[DEVISE] Please review the [changelog] and [upgrade guide] for more info on Hotwire / Turbo integration.

[changelog] https://github.com/heartcombo/devise/blob/main/CHANGELOG.md
[upgrade guide] https://github.com/heartcombo/devise/wiki/How-To:-Upgrade-to-Devise-4.9.0-%5BHotwire-Turbo-integration%5D

<!-- Devise installation -->
<!-- For admin flow and admin authentication -->
gem 'devise'

bundle i

<!-- now run devise installation command -->

rails generate devise:install

<!-- you will get the response -->
<!--Depending on your application's configuration some manual setup may be required:

  1. Ensure you have defined default url options in your environments files. Here
     is an example of default_url_options appropriate for a development environment
     in config/environments/development.rb:

       config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }

     In production, :host should be set to the actual host of your application.

     * Required for all applications. *

  2. Ensure you have defined root_url to *something* in your config/routes.rb.
     For example:

       root to: "home#index"
     
     * Not required for API-only Applications *

  3. Ensure you have flash messages in app/views/layouts/application.html.erb.
     For example:

       <p class="notice"><%= notice %></p>
       <p class="alert"><%= alert %></p>

     * Not required for API-only Applications *

  4. You can copy Devise views (for customization) to your app by running:

       rails g devise:views
       
     * Not required *

=============================================================================== -->


<!-- Run the Generator Command: -->
rails generate devise Admin


<!-- Confirm Devise Installation: -->
<!-- Check your config/routes.rb file for the addition of the Devise routes. -->
<!-- devise_for :admins -->

<!-- Also, verify that the app/models/admin.rb file was created. -->

<!-- Generate a Custom Controller: for Admins: -->

rails generate controller Admins::Sessions
rails generate controller Admins::Registrations
rails generate controller Admins::Passwords

<!-- Start creating devise views for admin -->

rails generate devise:views admins/sessions
rails generate devise:views admins/registrations
rails generate devise:views admins/passwords


<!-- 
  [DEVISE] Please review the [changelog] and [upgrade guide] for more info on Hotwire / Turbo integration.

  [changelog] https://github.com/heartcombo/devise/blob/main/CHANGELOG.md
  [upgrade guide] https://github.com/heartcombo/devise/wiki/How-To:-Upgrade-to-Devise-4.9.0-%5BHotwire-Turbo-integration%5D 
-->

<!-- To create admin dashboard controller -->

rails generate controller Admins::Dashboard

<!-- Add required actions in admin_dashboard_controller -->

<!-- add routes -->
<!-- 
  namespace :admins do
    get 'dashboard/index'
    get 'dashboard/users'
    get 'dashboard/products'
    # Add more routes as needed
  end 
-->

<!-- Creating product_category model manually-->

<!-- class ProductCategory
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :desc, type: String

  validates :name, presence: true

  # Add any other model logic or associations as needed
end -->

<!-- Create product categories through console -->

<!-- ProductCategory.create(name: "T-SHIRTS", desc: "T-Shirts") -->
<!-- ProductCategory.create(name: "SHIRTS", desc: "Shirts") -->
<!-- ProductCategory.create(name: "BOTTOMS", desc: "Bottoms") -->
<!-- ProductCategory.create(name: "JACKETS", desc: "Jackets") -->
<!-- ProductCategory.create(name: "ACCESSORIES", desc: "Accessories") -->

<!-- save their images in same names -->

<!-- create Admins products controller using command -->
rails generate controller Admins::Products


<!-- Add new gem for aws s3 and carrierwave-mongoid to upload images-->

gem "carrierwave-mongoid", :require => "carrierwave/mongoid"

gem 'aws-sdk-s3', require: false # For AWS S3 support

<!-- 
##################################################
#  NOTE FOR UPGRADING FROM 4.3.0 OR EARLIER      #
##################################################

Paperclip is now compatible with aws-sdk-s3.

If you are using S3 storage, aws-sdk-s3 requires you to make a few small
changes:

* You must set the `s3_region`
* If you are explicitly setting permissions anywhere, such as in an initializer,
  note that the format of the permissions changed from using an underscore to
  using a hyphen. For example, `:public_read` needs to be changed to
  `public-read`.

For a walkthrough of upgrading from 4 to *5* (not 6) and aws-sdk >= 2.0 you can watch
http://rubythursday.com/episodes/ruby-snack-27-upgrade-paperclip-and-aws-sdk-in-prep-for-rails-5
 -->



 <!-- Stimulus example : How to use stimulus for ajax request for js 
  1. Make sure you have Stimulus installed in your Rails application. You can add it to your Gemfile and run bundle install.

  2. Create a Stimulus controller:

  rails generate stimulus ProductEdit

  3. This will generate a JavaScript controller file (product_edit_controller.js) in the app/javascript/controllers directory.

  4. In your product_edit_controller.js file, you can set up the controller to handle "Edit" button clicks and perform actions when the button is clicked:

  // app/javascript/controllers/product_edit_controller.js
  import { Controller } from "stimulus";

  export default class extends Controller {
    connect() {
      // Add an event listener to the "Edit" button element
      this.element.addEventListener("click", this.handleEditClick);
    }

    disconnect() {
      // Remove the event listener when the controller is disconnected
      this.element.removeEventListener("click", this.handleEditClick);
    }

    handleEditClick(event) {
      event.preventDefault();

      // Retrieve the product ID and edit path from data attributes
      const productId = this.element.dataset.key;
      const editPath = this.element.dataset.path;

      // You can perform actions here, such as making an AJAX request or redirecting
      // For example:
      // fetch(editPath, {
      //   method: "GET",
      // }).then(response => {
      //   // Handle the response, e.g., show a form to edit the product
      // });

      // Or you can simply redirect to the edit path
      window.location.href = editPath;
    }
  }

  5. In your HTML, you'll need to attach the data-controller attribute to the element that contains the "Edit" button to indicate that it's controlled by the product-edit controller:

  <div id="edit_product" data-controller="product-edit" data-key="<%= product&.id&.to_s %>" data-path="<%= edit_polymorphic_path(product) %>" class="col-md-2">
    <span class="material-symbols-outlined">
      edit
    </span>
  </div>

  6. With this setup, Stimulus will handle the click event for the "Edit" button, and you can perform actions within the handleEditClick function, such as making an AJAX request or redirecting to the edit path. This approach keeps your JavaScript behavior organized and structured within a controller.
  -->