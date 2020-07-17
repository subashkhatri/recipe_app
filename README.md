# RECIPE MANAGEMENT SYSTEM

This RMS(recipe management system) has a home page that list all the recipes sorted by the dates, they are added. The most 
recent shows first. The home page also contains a search bar where recipes can be searched by title or a word.
A detail page of recipe includes the recipe image, its ingredient and the prepration process (instructions).

The rms contains a signin/ signup functionality. A logged in user can create a new recipe, edit and delete the recipe that he has created. Only Admin user can delete the recipes that are created by other users. For admin user, we need to modify normal user from rails console by changing the value admin to true, as for other user the value of admin remains false(default). A logged in user can comment on a particular recipe.

Non-logged in users is able to see the recipe details. 

## Bonus Features 
* A unit test and functional test is done for the category only.
* Only admin can add categories
  * All the recipes are grouped by categories
* As per the recipes number increases we need to divide the pages, pagination is used to show the recipe list - 3 recipes   per page


### Technology used:

* Ruby version
  ruby '2.6.3

* Rails version
  rails '6.0.3'  

* System dependencies
  ubuntu linux 18.04

* Database Used and its version
  sqlite3 '1.4'

* How to run the test suite
  simply by typing 
    rake test
* Gem Used for Recipe Management System
  * will_paginate '3.1.0'
  * will_paginate-bootstrap
  * haml-rails '2.0'
  * simple_form
  * bootstrap-sass '3.4.1'
  * paperclip '6.0.0'
  * coccon
    as to work for coccon in rails 5 + we need to add coccon-js in our application.js file
  * devise

  #### references links of all the gems that i have used
  * https://github.com/mislav/will_paginate.git
  * https://rubygems.org/gems/will_paginate-bootstrap4/versions/0.2.2
  * https://github.com/haml/haml-rails
  * https://github.com/heartcombo/simple_form
  * https://github.com/twbs/bootstrap-sass
  * https://github.com/thoughtbot/paperclip
  * https://github.com/nathanvda/cocoon
  * https://github.com/heartcombo/devise
