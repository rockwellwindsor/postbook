# Ben Kinney - Ruby on Rails code project

This readme will serve as a walk-through to my process of building this project and it will provide information on the application.

## Project Summary

  Build an application based on the rubric provided.  There should be posts that can have comments and users that have to be authenticated before creating posts or comments.  

  * A few points

    * I pushed to git from the very beginning of this application so you could get a sense of my git patterns.  Probably a little overkill but I tend to do small pushes more often instead of large pushes less often.

    * Not sure if you guys use a git message template but you can see mine on my commit messages.

    * I use postgresql even in local development so if you download and run make sure to move the pg gem into a production block and add splite3 and then change the database.yml file (unless you use pg locally as well).

    * There is an instance set up on heroku (url below) with some dummy data so feel free to create posts, comments, try to break whatever you can, etc.

    * Image uploading in the editor is not set up yet.  I think I may develop this further into a template so I wanted to start working on it, which is why you see aws-sdk gem and paperclip gem in the gem file. 

    * Please feel free to view it on your mobile devices as well.

  * Heroku: https://rocky-tor-88366.herokuapp.com

## Project Rubric

Here I will discuss the objectives of the project and how I solved them.

* User can register and then must be authenticated before logging in.

  * I too prefer to use Devise for this setup and was glad to see it mentioned in the project directions.  I used only the functions of Devise asked for in the project directions, ignoring the locking, omniauth functionality.

* Users can create posts (title, body, author)

  * Straightforward Ruby on Rails Scaffold to generate posts. 

  ````
  $ rails g scaffold Post title:string body:text user:references
  ````

* Users can comment on other's posts

  * Same as the Post.

  ````
  $ rails g scaffold Comment body:text user:references post:references
  ````

* The post index page serves as the site root page and shows all posts with title and author's name.

* Posts are ordered from new to old.

  * Set default scope for posts order in the model, post.rb.

* There is a post show page that shows a single post.  Underneath the posts are all the comments for that post, ordered by date (descending order).

  * Set default scope for comments order in the model, comment.rb.

* When commenting on a post the input field position is left up to the developer.

  *  I just AJAX the form in at the bottom of the list so the comment appears where the button is.  I do have to admit that ordering the comments with oldest at the top provided a little bump in development.  Typically I would not want the button to be at the bottom of the list, but I would also order comments newest to oldest just like the posts. I fixed what could be a UX issue (if there where a lot of comments it would hide the button) by keeping the button up top but scrolling to the newly posted comment at the bottom of the list before revealing the form.

## Project Requirements

* Upload to Github.

  * You're looking at it. The Heroku URL is: https://rocky-tor-88366.herokuapp.com

* Use latest version of Rails 4

  * I used 4.2.8.  It was the highest version of Rails 4.  I also have experience with Rails 5.

* Use Ruby 2.2 or greater

  * I used 2.2.2

* Rspec unit tests (minimum of 10).

  *  I flagged the test I wrote so you can do a directory search for them.  These are test outside of the normal templates that Rspec generates.  Search for ROCKWELL_SUBMISSION_TEST

* One feature test (rspec/capybara)

  * These tests can be found in spec/features/authentication_spec.rb

* Use whatever gems required to get the job done

  ###### Gem List

  This is a list of all the gems I added to the Gemfile and why I added them.

  * devise - User authentication
  * sendgrid - Email service
  * dotenv-rails - I prefer to use a .env file for environment variables on my local machine.
  * database_cleaner - Empty out test database.
  * factory_girl_rails - Set up factories
  * capybara - Interact with the page
  * bootstrap-sass - Use bootstrap
  * breadcrumbs_on_rails - Breadcrumb navigation
  * faker - Create dummy data for posts
  * ckeditor - Writing better posts
  * font-awesome - Because it's awesome
  * will_paginate-bootstrap - Post pagination

## Summary

Hope you guys enjoy the posts, look forward to talking more.  You can reach me by my email anytime or by phone between 10am and 3pm central time.

Thanks,<br/>
Rockwell Windsor Rice

