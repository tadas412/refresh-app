# Refresh

<h2> Initial Final Project Proposal </h2>

<h2> Final High Level Description of Application </h2>

<h2> Log of what was done (and who did what) </h2>

<i> First Assignment </i>

I developed a schema for two tables that will eventually be key to this site: events and reviews. Events have 5 components: name, rating, attendance, thumbs_up, thumbs_down. Reviews also have 5 components: user, review, rating, thumbs_up, thumbs_down. 

Each schema is set up with a controller, model, index, and new action device. This allows the data to be both viewed and added to. The homepage setup has links to each of these respective pages. 

<i> Second Assignment </i>

I added edit, show, and destroy functionality for each of the two tables I created for the last assignment. There are now links corresponding to these actions found when viewing the index page for either table. 

<i> Third Assignment </i>

Added a users schema so we can have users login using devise (only initially implemented index and new). Incorporated devise onto users. Added a navbar like we did in class. Edited the devise new/edit views to incorporate the name field. Also created my own show page to display the users that I've already made. <br>

Validations added: name can't be blank and must be unique, password must be between 8 and 12 characters long.

<i> Fourth Assignment </i>

Added a "creator" and "creator email" field to the event object. Added a temporary "notify email" to the review structure. Eventually, events and reviews will be linked up and this notify email will be unnecessary.

Added the send grid add-on to the application. The add-on is used to send an email to the notify_email field of reviews when someone posts the review. Local version works. There's a bug in the production version that throws an error when you send an email. Haven't been able to resolve.

<i> Fifth Assignment </i>

Added the use of 4 queries to the app. 

"Most Popular Event: " - event with greatest attendance (order by, limit)
* Listed by default in the index events page (events_controller.rb)

"Thumbs Up Reviews" on reviews index (condition)
* Listed in index reviews page (reviews_controller.rb)

"Show 5 most recent reviews" button on reviews index
* Clicking will bring up a page with the 5 most recent reviews (order by, limit)
* new method in reviews_controller: index_recent
* routed it as well

"Sort by rating" button on events index
* Allows sorting of the events (order by)
* Reloads the page with &sort=rating GET param
* events_controller.rb handles the logic here

<i> Sixth Assignment </i>

Progress towards final product: added a search function to the navbar. This allows users to search for events that have happened in the past, displays a list of matches, and upon click navigates you to that event's page. Not as substantial an addition as I would have hoped to accomplish by this marker, will be sure to ramp it up soon.

Note that, for the seventh and final assignment, I scrapped most of what I had done to this point and rebuilt everything you see in the final product (re-used some bits of code). 

<h2> Challenges encountered, and how they were solved </h2>

<i> First Assignment </i>

Spent hours trying to get rails working despite initially having sufficient versions of ruby and rails installed. rails generate was not working, and was having various issues with installing gems (e.g. sqlite3 and pg). Attempted full re-install of rvm, ruby, and rails. Was having issues with re-installing rails until I added to the environmental variable ARCHFLAGS and manually set some paths: <i> sudo env ARCHFLAGS="-arch x86_64" gem install rails -- --use-system-libraries --with-xml=/usr/local/Cellar/libxml2/ </i>. The issue seems to be OSX 10.10 specific. 

<i> Second Assignment </i>

One bug I ran across was the use of review_path versus reviews_path. reviews_path is coded to generate a link by appending a dot as a delimiter (e.g. path/to/link.5) as opposed to another slash (e.g. path/to/link/5), as review_path does. 

Also had a minor issue with using the rails :delete command for destroying. Apparently the production environment variable (config/environments/production.rb) config.assets.compile must be set to true, otherwise the destroy process won't work when deployed on heroku. Source: http://stackoverflow.com/questions/26697251/rails-apps-destroy-delete-method-is-not-working-on-heroku-but-works-in-local-ma

<i> Third Assignment </i>

Initially forgot that I needed to add a "gem 'devise'..." line in Gemfile -- wasn't sure why bundler wasn't installing devise. <br>

Had an issue getting devise to work on production...realized I forgot to run heroku run rake:db migrate <br>

<i> Fourth Assignment </i>

Didn't have explicit instructions for how to add the creator/creator email fields to my events; was good spending some time in the code without guidance. Note: found out that I needed to run "rails generate migration add_fieldname_to_tablename fieldname:string" in order to add another field to the model. 

<i> Fifth Assignment </i>

Implementing the first two queries was straightforward - very similar to methods that were shown in class. For the second two, I did some additional work. For showing the most recent reviews, I created another page associated with another method in the controller. To make this work, I had to add a collection to the reviews resources to allow another view to function. For the fourth query, I added a specially formed button via HTML form that includes a hidden value for the sort parameter. I added logic to the events controller to act appropriately.

<i> Sixth Assignment </i>

Had some null pointer issues because of my edits to index. Made the events/index erb take it into account by checking for a nil @pop_event variable. 

<i> Seventh Assignment </i>

Bootstrap was a new experience for me. Surprisingly easy to use - can't wait to apply it to other small projects that I might undertake. Sometimes it was difficult forcing myself to figure out how to use Bootstrap to get something done (centering, etc) as opposed to reverting to raw HTML or CSS coding. 




<h2> Link to the corresponding Heroku site </h2>

refresh-application.herokuapp.com

