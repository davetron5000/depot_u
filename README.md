= To Use

```
bundle install
yarn install
gem install mailcatcher # cannot put in Gemfile due to rack incompatibilities
bin/rails db:setup
bin/webpacker
bin/rails s
```

Navigate to http://localhost:3000/admin and log in as user `admin` password `p22ssw0rd!`

Then navigate to `http://localhost:3000/support_requests`

From here, add a response to a support ticket using rich text.  **BE SURE** to upload an image by dragging it into the rich text
editor.

When you save it, you should see your response rendered inline properly.

*NOW* exit the server and go to the console: `bin/rails c`

Find the `SupportRequest` you created and examine the response

```
bin/rails c
console> puts SupportRequest.last.response.body.to_s; nil
```

You sould see that the `<img` tag uses `example.org` as its `src=`, not `localhost:3000`


= The Depot Online Store

This application implements an online store, with a catalog, cart, and orders.

It is divided into two main sections:

* The buyer's side of the application manages the catalog, cart, 
  and checkout. It is implementation spans in four models and associated
  controllers and views: Cart, LineItem, Order, and Product.  Additionally,
  there is a StoreController for the store front itself, and a
  SessionsController to manage sessions.

* Only administrators can access stuff in the seller's side
  (product maintenance and order fulfillment).  This is implemented by the
  SessionsController, is enforced by the ApplicationController#authorize
  method, and assisted by the Users and Carts resources.

This code was produced as an example for the book {Agile Web Development with
Rails}[http://www.pragprog.com/titles/rails4/agile-web-development-with-rails-4th-edition]. It should not be 
run as a real online store.

=== Authors

 * Sam Ruby, IBM
 * Dave Thomas, The Pragmatic Programmers, LLC
 * David Heinemeier Hansson, 37signals

=== Warranty

This code is provided for educational purposes only, and comes with 
absolutely no warranty. It should not be used in live applications.

== Copyright

This code is Copyright (c) 2013 The Pragmatic Programmers, LLC.

It is released under the same license as Ruby.
