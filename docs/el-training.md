# el-training

## About this curriculum

This document is a curriculum for new employee education to learn the basics of Ruby on Rails and its peripheral technologies, which are essential for Manyo.
Regardless of the ability of new employees, you will be required to carry out one step.
The training period is not specified.
The training will be completed when all steps are completed.

This curriculum assumes the following characters.

--New employee: A student of this curriculum.
--Supporter: We provide education, guidance, and advice for new employees. It also plays the role of consulting with new employees and deciding specifications together.

It is at the discretion of the supporter how much the supporter is involved in the guidance. In addition, regarding the training period, the supporters will set a guideline in advance, taking into consideration the skill level of new employees and the status of internal projects.

## Overview

### System requirements

In this curriculum, you will be asked to develop a task management system as an issue.
The task management system wants to do the following:

――I want to easily register my task
--I want to be able to set an expiration date for a task
--I want to prioritize tasks
--I want to manage the status (not started / started / completed)
--I want to narrow down the tasks by status
--I want to search for a task by task name / task description
--I want to list tasks. I want to sort on the list screen (based on priority, expiration date, etc.)
――I want to classify tasks with labels etc.
--I want to register as a user so that I can see only the tasks I registered.

We also want the following management functions to meet the above requirements.

--User management function

### Support Browser

--Support browser is assumed to be the latest version of macOS / Chrome

### About application (server) configuration

I would like you to build using the following languages ​​and middleware (all are the latest stable versions).

--Ruby
--Ruby on Rails
--PostgreSQL

For the server, please use the following.

--Heroku

* Performance requirements and security requirements are not specified, but please make with general quality.
  If the site is too unresponsive, please improve it.

## Ultimate goal of this curriculum

At the end of this curriculum, it is assumed that you will learn the following items.

--Being able to implement basic web applications using Rails
--A Rails application can publish an application using a general environment
--Additional functions and data maintenance for published Rails applications
--Learn the flow of PR and merging on GitHub. Also, learn the Git commands required for it.
  --Being able to commit with appropriate particle size
  ――Being able to write a PR description properly
  --Being able to respond to reviews and make corrections
--Being able to ask questions to team members and related parties (this time I will be a supporter) verbally or chat at the right time.

## Recommended books

The following books are recommended as recommended books for advancing the training curriculum.

-[Ruby on Rails 5 Quick Learning Practice Guide that can be used in the field] (https://book.mynavi.jp/ec/products/detail/id=93905)

The Ruby on Rails 5 Quick Learning Practical Guide that can be used in the field focuses on the task management system as well as the training curriculum.
Therefore, I think there are many points that can be helpful in advancing this training.

It also explains what was not covered in this training and how to proceed with team development. Please refer to it.

## Topic collection useful for development

I have summarized the topics I would like you to take advantage of in topics.md, although they were not included in the specific issue steps. Please refer to and utilize it as necessary when implementing the curriculum.

## Challenge steps

### Step 1: Build a Rails development environment

#### 1-1: Install Ruby

-Use [rbenv] (https://github.com/rbenv/rbenv) to install the latest version of Ruby.
--Check that the Ruby version is displayed with the `ruby -v` command

#### 1-2: Rails installation

--Install Rails with Gem command
--Please install the latest version of Rails
--Check that the Rails version is displayed with the `rails -v` command

#### 1-3: Installation of database (PostgreSQL)

--Let's install PostgreSQL on your OS
  --For macOS, please install with `brew` etc.

### Step 2: Create a repository on GitHub

--Install Git at hand
  --For macOS, please install with `brew` etc.
  --Register your username and email address with `gitconfig`
--Let's think about the application name (= repository name)
--Let's create a repository
  --If you don't have an account, get one
  --Let's create an empty repository on it

### Step 3: Create a Rails project

--Create the minimum required directories and files for your application with the `rails new` command
--Create a directory called `docs` directly under the project directory (application name directory) created by` rails new`, and commit this document file.
  ――This is to keep the specifications of this app under control so that you can see them at any time.
--Let's push the created application to the repository created on GitHub
--In order to specify the version, describe the version of Ruby to be used in `Gemfile` (Make sure that Rails already has the version).

### Step 4: Think about the image of the application you want to create

――Before designing, let's think about the completed image (with supporters) of what kind of app it will be. Screen design by paper prototyping is recommended
  ――Let's think about how this app will be used (whether it will be published on the Internet, for internal use, etc ...) (with supporters).
--Read the system requirements and think about the data structure you need
  ――What kind of model (table) seems to be needed?
  ――What kind of information is needed in the table?
――If you think about the data structure, let's write it by hand on the model diagram.
  ――When completed, take a picture and put it in the repository.
  --Write the table schema in `README.md` (model name, column name, data type)

* It is not necessary to create the correct model diagram at this time. Let's make it as an assumption at the moment (Imagine repairing it if you think it is wrong in the future steps)

### Step 5: Let's set the database connection (peripheral settings)

--First, let's cut a new topic branch with Git
  ――After that, we will work on the topic branch and commit.
--Install Bundler
--Install `pg` (PostgreSQL database driver) with` Gemfile`
--Let's set `database.yml`
--Create a database with the `rails db: create` command
--Let's check the connection to the database with the `rails db` command
--Create a PR on GitHub for review
  ――If necessary, use WIP (Work In Progress) to issue a PR. Please refer to the topic collection for details.
  ――If you have any comments, please respond accordingly. If you have 2 LGTM (Looks Good To Me), merge them into the master branch.

### Step 6: Set up RuboCop
--Set RuboCop as Linter / Formatter
--In this curriculum, we will use [retrieva-cop] (https://github.com/retrieva/retrieva-cop) whose terms have been adjusted according to the creation of the Rails application.
--Install [retrieva-cop] (https://github.com/retrieva/retrieva-cop) with `Gemfile`
--Introduce Circle CI to run RuboCop when creating a PR
  ――It doesn't matter if the supporter implements it, considering the difficulty level.
――After that, let's update the coding conventions as needed in consultation with supporters and reviewers.

### Step 7: Let's create a task model

Create CRUD to manage the tasks.
First of all, let's make it with a simple structure where only the name and details can be registered.

--Create the model class required for CRUD of tasks with the `rails generate` command
--Create a migration and use it to create a table
  ――It is important to ensure that the migration can be returned to the previous state! Get in the habit of playing `redo` to check
  --Don't forget to set DB restrictions as well.
--Make sure you can connect to the database via the model with the `rails c` command
  --At this time, let's try creating a record with ActiveRecord.
--Let's set validation
  --Let's think about which validation should be added to which column
--Create a PR on GitHub for review

### Step 8: Allow tasks to be viewed / registered / updated / deleted

Let's create a task list screen, detail screen, create screen, edit screen, and delete function.

Creating these features all at once tends to make your PR huge.
Therefore, in step 8, we will proceed with PR by dividing it into multiple parts.

In future steps, if the PR is likely to increase, consider whether you can issue the PR in two or more.

### Step 8-1: Let's create a task list screen and detail screen

--Let's make it possible to display the task created in step 7 on the list screen and detail screen.
--Create controllers and views with the `rails generate` command
  ――Let's decide which template engine to use in consultation with the supporters.
--Add the required implementations for your controller and view
--Edit `routes.rb` so that the task list screen is displayed at` http: // localhost: 3000 / `
--Let's explain to the supporters what kind of processing is being done between the web browser and the server.
--Create a PR on GitHub for review

### Step 8-2: Let's create a task creation screen and edit screen

--Let's make it possible to create and edit tasks from the screen
--Let's display a flash message on the screen after creating and updating.
  --If a validation error occurs, display an error message on the screen.
--Create a PR on GitHub for review

### Step 8-3: Let's be able to delete the task

--Let's be able to delete the created task
--Let's display a flash message on the screen after deletion
--Create a PR on GitHub for review

### Step 8-4: Let's look back at the added code

--Let's explain the code added in steps 8-1 to 8-3 to the supporters.
  --About classes, methods and variables
  --About the processing flow

### Step 9: Let's get in touch with SQL

--Let's operate the database
  --Let's connect to the database with the `rails db` command
  --View, create, update and delete tasks in SQL
--Access the task list screen and check that the SQL log is flowing.
  ――Let's explain to the supporters what kind of SQL is being executed.
--Let's check what kind of SQL is executed by the method of ActiveRecord
  --Let's run `find`,` where`, etc. with `rails c`

### Step 10: Write a test

--Get ready to write the spec
  --Prepare `spec / spec_helper.rb`,` spec / rails_helper.rb`
--Let's write a model spec for validation
  ――Actually, I don't write much validation test, but let's do it to deepen the understanding of model spec.
--Let's write a system spec for the task function
--Let's integrate RSpec with Circle CI and notify Slack
  --Similar to step 6, it can be done by the supporters.
--Reference book: https://leanpub.com/everydayrailsrspec-jp

### Step 11: Let's standardize the Japanese part of the app

--Let's use Rails' i18n mechanism to output validation error messages in Japanese.

### Step 12: Set your Rails timezone

--Set the Rails time zone to Japan (Tokyo)

### Step 13: Sort the task list in order of creation date and time

--Currently, they are sorted in order of ID, but let's sort them in descending order of creation date and time.
--Let's write in the system spec that the sorting is working well

### Step 14: Let's deploy

--Now you have a simple task management system on your master branch, let's deploy it.
--Let's deploy to Heroku
  --If you don't have an account, create one
--Let's touch the deployed app on Heroku
  ――From now on, let's register tasks in this app and proceed with development.
  -* However, Heroku applications can be referenced anywhere on the Internet, so please do not post information that is not good for publication.
    --Basic authentication may be included at this point
  ――In the future, let's continuously deploy your app to Heroku after each step
--Let's describe the deployment method in `README.md`
  ――At that time, it is even better to include the version information of the framework used in this app.

### Step 15: Add an expiration date

--Let's make it possible to register an expiration date for a task
--Let's be able to sort by expiration date on the list screen
--Let's expand the spec
――If you publicize and get a review, let's release it

### Step 16: Add status to make it searchable

--Let's add status (not started / started / completed)
  -[Option] If you are not a beginner, you may install a Gem that manages the state.
--Let's make it possible to search by title and status on the list screen
  -[Option] If you are not a beginner, you may install a Gem that makes it convenient to implement search such as ransack.
--When narrowing down, let's check the changes in the issued SQL by looking at the log.
  ――Get in the habit of checking as needed in the following steps
--Paste the search index
  --Prepare a certain amount of test data, check the operation while looking at log / development.log, and confirm that adding an index improves the speed.
  -[Option] Let's check the index usage status on the database side using PostgreSQL explain etc.
--Let's add a model spec to the search (let's expand the system spec as well)

### Step 17: Set priorities (* Can be omitted if you have similar implementation experience)

--Let's make it possible to register priorities (high, medium, low) for tasks
--Let's sort by priority
--Let's expand the system spec
――If you publicize and get a review, let's release it (please continue)

### Step 18: Let's add pagination

--Let's add pagination to the list screen using a gem called Kaminari

### Step 19: Guess the design

--Introduce Bootstrap and apply your design to the apps you've created so far
  -[Option] Write and design your own CSS

### Step 20: Let's create a user model

--Let's create a user model
--Let's create the first user with seed
--Let's link the task with the first user created with seed
  --Let's index the association
  -* When deploying to Heroku, make sure that the already registered task is linked to the user (data maintenance).

### Step 21: Implement login / logout functionality

--Let's implement it yourself without using additional gems
  --By not using Gem such as Devise, the purpose is to deepen your understanding of the mechanism such as HTTP cookies and Session in Rails.
  ――The purpose is also to deepen your understanding of general authentication (such as password handling).
--Let's implement a login screen
--If you are not logged in, make sure that you cannot move to the task management page.
--When you create a task, let's associate the task with the logged-in user.
--Let's display only the tasks that you created
--Let's implement the logout function

### Step 22: Let's implement the user management screen

--Let's add a management menu on the screen
--Be sure to add the URL `/ admin` to the beginning of the management screen.
  --Before adding to `routes.rb`, let's design by assuming the URL and routing name (name that becomes` * _path`) in advance.
--Let's implement user list / create / update / delete
--After deleting a user, try deleting the tasks that the user has.
--Let's display the number of tasks that the user has on the user list screen.
  --Incorporate a mechanism to avoid the N + 1 problem
--Let's see the list of user-created tasks

### Step 23: Let's add a role to the user

--Let's make users distinguish between administrative users and general users
--Let's make the user management screen accessible only to the management user
  --Let's make a special exception when a general user accesses the management screen
  --Catch the exception and display the error page appropriately (you can do it in step 25)
--Let's make it possible to select a role on the user management screen
--Let's control the deletion so that no administrative user is lost
  --Let's use the model callback
-* You can use or not use Gem freely.

### Step 24: Let's be able to label tasks

--Let's make it possible to put multiple labels on a task
――Let's make it possible to search by the attached label

### Step 25: Set the error page properly

--Let's make the default error page provided by Rails the screen you created.
--Set the error page appropriately according to the situation
  --Two types of status code settings, page 404 and page 500, are required at least.

## Postscript

Thank you for your hard work.
You have completed the educational curriculum !!

I couldn't cover it in this curriculum, but I think that the following topics will be needed in the future, so I think it's a good idea to proceed with learning (I think that you will often learn through projects).

--Deepen a basic understanding of web applications
  --Understanding HTTP and HTTPS
--Learn a little more advanced use of Rails
  --STI
  --Logging
  --Explicit transaction
  --Asynchronous processing
  --Asset pipeline (rather a release topic)
--A more advanced understanding of frontends such as JavaScript and CSS
--Deepen your understanding of the database
  --SQL
  ――Building queries that emphasize performance
  —— Deepen your understanding of the index
--More understanding of server environment
  --Linux OS
  --Web server (Nginx) settings
  --Application server (Unicorn) settings
  --Understanding the settings related to PostgreSQL
--Understanding tools related to release
  --Capistrano
  --Ansible