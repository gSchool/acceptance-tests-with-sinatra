# Acceptance Tests with Sinatra

Acceptance tests let us write tests from the perspective of users of our
application. In Ruby, we can write acceptance tests using the [Capybara](https://github.com/jnicklas/capybara) gem.

## Getting Started

1. Fork and clonse this repository
1. Change directory into the repository you cloned
1. Run `bundle install` to ensure you have RSpec and Capybara installed
1. Run `rackup` to start the application

## Example App

This repository contains a sample Sinatra application we will use to
look at writing acceptance tests. The app is located in `app.rb`.

## Writing Acceptance Tests

Acceptance tests require a little more configuration than the RSpec tests that
we have been writing. The first change is in the spec_helper.rb file:

    require 'capybara/rspec'
    require "./app"

    Capybara.app = SampleApp


Instead of requiring the specific files we are testing, we require our entire
Sinatra application. Additionally, we have to set the Capybara.app setting
to the name of our Sinatra application (SampleApp in this example).

We will still write our tests in the spec diretory, but now they need to go into
the features directory inside the spec directory. Also note that they use `feature` and
`scenario` instead of `describe` and `it`.

spec/features/homepage_spec.rb:

    require "spec_helper"

    feature "Homepage" do
        scenario "should have a greeting" do
            visit "/"

            expect(page).to have_content("Homepage")
        end
    end

## Capybara

1. Capybara Documentation: [http://rubydoc.info/github/jnicklas/capybara/master](http://rubydoc.info/github/jnicklas/capybara/master)
1. Examples of the methods Capybara provides to interact with your web pages: [https://github.com/jnicklas/capybara#the-dsl](https://github.com/jnicklas/capybara#the-dsl)


Common Capybara methods used:

1. visit "/" - visit a page, similar to entering an address in your browser
1. click_link  - click a link on the page
1. expect(page).to have_content "content" - make sure that the word "content" is on the page
1. save_and_open_page - see what HTML the test is seeing
1. within - https://github.com/jnicklas/capybara#scoping
1. have_css - https://github.com/jnicklas/capybara#querying
