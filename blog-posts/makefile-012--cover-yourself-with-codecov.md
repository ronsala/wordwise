# Makefile 012: Cover Yourself With Codecov

Having recently graduated from Flatiron School, I'm going though by portfolio projects to refactor them into the best portfolio I can produce.

My very first project was [WordWise](https://rubygems.org/search?query=wordwise), a Ruby Gem that scrapes [Dictionary.com](https://www.dictionary.com/) to make a fun quiz game. While refactoring, I don't want to break any app, much less this one that to my complete astonishment has now been downloaded over 6000 times. I want to make sure I have good test coverage before I begin.

I have a vague memory of trying out [Codecov](https://about.codecov.io/) as a command line tool a while ago, so I decided to see how it could help and was pleased to see it has an integration with GitHub that's free for a small open source project like mine. Even though my project happens to be in Ruby, they also serve some 20 other languages.

To use it, go to their [homepage](https://about.codecov.io/) and sign up with your code host (GitHub, GitLab, etc.). Choose the repo you want to use it with. (If you have a lot and the one you want is near the end of the alphabet it may take a few minutes for the syncing to reach it.) You'll be given a token you can set in your CI environment variables. (I saved mine in a secure location.) Then you can look at an example repo and get quick-start and language-specific setup guides.

Codecov recommends using their service with a continuous integration provider to run your tests and upload a report. In next week's post, I'll write about setting this up.
