# Personal Project: Rails Dictionary App
______________________

 >A dictionary based on Member submissions. A signed in user can submit a word for others to define, or submit a definition to an existing word. Users vote each others definitions and the most voted for surfaces on top. User sumissions have their names and date of submission under the words and definitions. Words can be tagged and are searchable. The plus sign next to a search bar gets you to a contribution page. First tab lets you contribute new word with or without definition. Second has a dropdown to select a known word from so he/she can submit their own definition.
_______________________

Please check out the app @ [Dictionary App](https://dictionaryapp-lizk.herokuapp.com/)

# Project Images

![Dictionary App Images](https://drive.google.com/uc?export=view&id=1YDXDYADKGjwC9DAYH3611kTKqxkoL_vE)

![Dictionary App Images](https://drive.google.com/uc?export=view&id=18VoihkF3l6qT4JzjUETvERTUNXXhxc5G)

![Dictionary App Images](https://drive.google.com/uc?export=view&id=12mC6OLUOQ3QtTeOBMlDl16Ogw2k7b-8l)

## Features

* rails 5.1 app
* postgres database both on local and heroku
* scaffold definition
* scaffold word
* devise gem 
* modify devise strong params to accept first_name and last_name - registration and account update
* bootstrap
* conditional links in the collapsible bootstrap navbar
* seed file for first 10 users
* faker gem for next 50
* break points - 10% padding on the sides for when browser width is over 992px
* display which user wrote which answer
* make definitions a nested route so I can call a new definition on each word
* how to handle multiple models in a single form: form for both new word and new definition
* when submitted through this form the nested definition gets assigned same user_id as the word
* limit each do loop
* font awesome icons
* acts_as_voter gem on the nested resource definition
* check if the record (word) exists, before saving to database: first_or_create method; and then save the nested model by giving first_or_create method a block with nested attributes
* display words by date and top ranked definition first
* votes tally on the index page
* order by most voted, order runner ups by date
* bootstrap tabs to manage multiple submission forms
* a little js to toggle a button between 2 states: one that says "I don't know the definition" and minimizes the text area, and another that says "Add Definition" and opens the text area.
* will_paginate bootstrap 4
* flash message styling
* presence validations
* style validation errors
* add tags gem, fields for adding tags, and list most popular tags under the words
* get rid of partial form and all_form and move all content to corresponding views to prevent edit from pulling in form, which in turn renders the definition field for the edit in every case, which is not what we want
* paragraph editing for text input 
* disable turbolinks for each link 
* dropdown menu "Browse" that lets you select a letter
* order content on button click to display all words starting with the selected letter
* working simple search bar
* gritter - This gem allows you to easily add Growl-like notifications to your application using a jQuery plugin. - doesn't work yet
* friendly_id gem for slugging. It lets you create human-friendly strings instead of numeric ids.
* apply pagination and search with AJAX  -  not working as of yet

## Installation

- clone the repo and navigate to the project directory
- `rails s` to run locally
- Open http://localhost:3000 to view it in the browser

## Authors

Eliza Khachatryan

