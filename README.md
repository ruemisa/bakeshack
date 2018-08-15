# BAKE SHACK #

**Bake Shack** is a Full-stack website of a food establishment, particularly a bakery. The project followed a mobile-first pattern. 

## Table of Contents ##

1. Technologies Used 
1. Installation 
1. Components
1. Author's Notes
1. Author

#### Technologies Used ####

The following are the technologies used to accomplish this project:

* Ruby
* Sinatra
* API via eventbrite
* HTML5
* CSS3
* JavaScript

#### Installation ####

You will need to install the following gems for the project:

* sinatra
```{r engine='sh'} 
$ gem install sinatra 
```
* json
```{r engine='sh'}
$ gem install json 
```

* httparty
```{r engine='sh'}
$ gem install httparty 
```

#### Components ####

* Main 
    server.rb -> contains the API Wrapper, routes, and classes for the data for the bakery

* Views
    layout.erb -> Fixed layout common for all pages.
    home.erb -> Landing Page of the Site
    cakes.erb -> Page for all cakes for sale
    cookies.erb -> Page for all cookies for sale
    muffins.erb -> Page for all muffins for sale
    events.erb -> Events from API are generated here

* Public
    style.css -> Most styling goes here
    product.css -> Styling for all products sold
    event-page.css -> Styling for the events page
    overlay.css -> Styling for the main menu
    effects.css -> All effects go here
    media.css -> All media queries go here
    menu.js -> Functionality for the main menu
    images -> All food images and icons

#### Author's Notes ####

I feel pretty good about this project since this is my first Full-stack project. 

I am planning to build on this project in the future as I have prepared some cart and checkout features already.

Thank you for visiting.

#### Author ####

Ruel Alfonso Misa