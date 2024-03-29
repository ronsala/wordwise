# Devlog

*Entries by Ron Sala unless otherwise noted.*

Mon Sep 13 05:17:45 EDT 2021

Beginning to upgrade the app, based largely on Flatiron School's Software Engineering Post Work curriculum. Will also expand tests to ensure functionality as I refactor and add features.

Created `testing` branch. Moved `NOTES.md`, `spec.md` to `/notes`. Added this file.

```
RONALDs-MacBook-Pro-2 dev/wordwise ‹testing› » rspec
/Users/RonSala/.rvm/gems/ruby-2.6.3/gems/pry-0.13.1/lib/pry/cli.rb:8: warning: already initialized constant Pry::CLI::NoOptionsError
/Users/RonSala/.rvm/gems/ruby-2.6.3/gems/pry-0.13.1/lib/pry/cli.rb:8: warning: previous definition of NoOptionsError was here

[!] There was an error parsing `Gemfile`: 
[!] There was an error while loading `wordwise.gemspec`: uninitialized constant Pry::Command::ExitAll. Bundler cannot continue.

 #  from /Users/RonSala/Dropbox/dev/wordwise/wordwise.gemspec:5
 #  -------------------------------------------
 #  require 'open-uri'
 >  require 'pry'
 #  require 'nokogiri'
 #  -------------------------------------------
. Bundler cannot continue.

 #  from /Users/RonSala/Dropbox/dev/wordwise/Gemfile:11
 #  -------------------------------------------
 #  # Specify your gem's dependencies in wordwise.gemspec
 >  gemspec
 #  -------------------------------------------

No examples found.
```

```
RONALDs-MacBook-Pro-2 dev/wordwise ‹testing*› » bundle
```

,

```
RONALDs-MacBook-Pro-2 dev/wordwise ‹testing*› » ruby bin/wordwise
```

and 


```
RONALDs-MacBook-Pro-2 dev/wordwise ‹testing*› » bundle install
```

give same error.

Fri Sep 17 04:25:19 EDT 2021

Removed and recreated Gemfile.lock. Now getting:

```
RONALDs-MacBook-Pro-2 dev/wordwise ‹testing*› » ruby bin/wordwise
Traceback (most recent call last):
        8: from bin/wordwise:3:in `<main>'
        7: from bin/wordwise:3:in `require_relative'
        6: from /Users/RonSala/Dropbox/dev/wordwise/config/environment.rb:6:in `<top (required)>'
        5: from /Users/RonSala/.rvm/gems/ruby-2.6.3/gems/require_all-3.0.0/lib/require_all.rb:96:in `require_all'
        4: from /Users/RonSala/.rvm/gems/ruby-2.6.3/gems/require_all-3.0.0/lib/require_all.rb:96:in `each'
        3: from /Users/RonSala/.rvm/gems/ruby-2.6.3/gems/require_all-3.0.0/lib/require_all.rb:98:in `block in require_all'
        2: from /Users/RonSala/.rvm/gems/ruby-2.6.3/gems/require_all-3.0.0/lib/require_all.rb:208:in `__require'
        1: from /Users/RonSala/.rvm/gems/ruby-2.6.3/gems/require_all-3.0.0/lib/require_all.rb:208:in `require'
/Users/RonSala/Dropbox/dev/wordwise/lib/cli.rb:2:in `<top (required)>': uninitialized constant Wordwise (NameError)
        6: from bin/wordwise:3:in `<main>'
        5: from bin/wordwise:3:in `require_relative'
        4: from /Users/RonSala/Dropbox/dev/wordwise/config/environment.rb:6:in `<top (required)>'
        3: from /Users/RonSala/.rvm/gems/ruby-2.6.3/gems/require_all-3.0.0/lib/require_all.rb:96:in `require_all'
        2: from /Users/RonSala/.rvm/gems/ruby-2.6.3/gems/require_all-3.0.0/lib/require_all.rb:96:in `each'
        1: from /Users/RonSala/.rvm/gems/ruby-2.6.3/gems/require_all-3.0.0/lib/require_all.rb:97:in `block in require_all'
/Users/RonSala/.rvm/gems/ruby-2.6.3/gems/require_all-3.0.0/lib/require_all.rb:102:in `rescue in block in require_all': Could not require /Users/RonSala/Dropbox/dev/wordwise/lib/cli.rb (uninitialized constant Wordwise). Please require the necessary files (RequireAll::LoadError)
```

Next time, will continue debugging.

Sat Oct 16 20:09:37 EDT 2021

The problem seems to have been with require_all not recognizing the Wordwise namespace. I see the master branch on GitHub has v 2.0.0, while the master branch locally has 3.0.0. I remain confused, though, why the local master and testing branches had load errors while a subsequently created require_all branch does not, even though all list 3.0.0 in Gemfile.lock.

Tried to recreate the problem with `bundle`, `bin/setup`, and `rake spec`. I see from my notes above I had run `rspec`. Perhaps this was the source of the issue. I see from the README, this is not the specified command. Leaving well enough alone....

Now setting up Codecov though GitHub and writing a blog post about it.

Tue Oct 19 19:21:29 EDT 2021

Working on setting up CircleCI. Reading the [docs](https://circleci.com/docs/). Found a promising orb, [ruby-gem@0.2.1](https://circleci.com/developer/orbs/orb/zfhui/ruby-gem?utm_source=google&utm_medium=sem&utm_campaign=sem-google-dg--uscan-en-dsa-maxConv-auth-brand&utm_term=g_b-_c__dsa_&utm_content=&gclid=CjwKCAjw2bmLBhBREiwAZ6ugo5wGiuvzqbtVF5VmMVDdAAoRK9Ikg0qUrJh3chk_mRCGWaDQDK9aBxoCwb0QAvD_BwE).

Sun Oct 24 16:41:45 EDT 2021

Bumped racc from 1.5.2 to 1.6.0.

Bumped bundler from 2.0.2 to 2.2.29. As a consequence, the Dependabot alert about it has been removed.

Found `rspec spec` leads to passing test.

Tried getting CircleCI to work but getting `config.yml is not valid`. Looks like I need an "executor" and Docker fits the bill.

Went to [https://docs.docker.com/get-started/overview/](https://docs.docker.com/get-started/overview/) and am following instructions.

Trying to set up Docker. Will do a pull request with this added sentence to test.

## 20220517

Switched to new date format for this log.

Pulled in a PR from Dependabot concerning a security vulnerability with nokogiri.

Changed the BASEURL to the new lexico domain, eliminating the need for a redirect.

Added `URI.` before each call to `open` when scraping, eliminating `No such file or directory @ rb_sysopen` errors.

Got rid of `Calling `DidYouMean::SPELL_CHECKERS.merge!(error_name => spell_checker)' has been deprecated. Please call `DidYouMean.correct_error(error_name, spell_checker)' instead.` when starting app by updating bundler:

```zsh
RONALDs-MacBook-Pro-2 dev/wordwise ‹workshop› » bundler -v
Calling `DidYouMean::SPELL_CHECKERS.merge!(error_name => spell_checker)' has been deprecated. Please call `DidYouMean.correct_error(error_name, spell_checker)' instead.
Bundler version 2.2.29
RONALDs-MacBook-Pro-2 dev/wordwise ‹workshop› » gem install bundler
Fetching bundler-2.3.13.gem
Successfully installed bundler-2.3.13
Parsing documentation for bundler-2.3.13
Installing ri documentation for bundler-2.3.13
Done installing documentation for bundler after 0 seconds
1 gem installed
RONALDs-MacBook-Pro-2 dev/wordwise ‹workshop› » bundle update --bundler
Fetching gem metadata from https://rubygems.org/.
Using rake 13.0.6
Using bundler 2.3.13
Using coderay 1.1.3
Using diff-lcs 1.4.4
Using method_source 1.0.0
Using mini_portile2 2.8.0
Using racc 1.6.0
Using nokogiri 1.13.6 (x86_64-darwin)
Using pry 0.14.1
Using require_all 3.0.0
Using rspec-support 3.10.2
Using rspec-core 3.10.1
Using rspec-expectations 3.10.1
Using rspec-mocks 3.10.2
Using rspec 3.10.0
Using wordwise 1.0.3 from source at `.`
Bundle updated!
```

```zsh
RONALDs-MacBook-Pro-2 dev/wordwise ‹workshop› » bcm "bump version from 1.0.3 to 1.0.4"
```

Added to gemspec: `add_runtime_dependency 'bundler', '~> 2.2', '>= 2.2.10'`.

```zsh
RONALDs-MacBook-Pro-2 dev/wordwise ‹workshop*› » gem build wordwise.gemspec
  Successfully built RubyGem
  Name: wordwise
  Version: 1.0.4
  File: wordwise-1.0.4.gem
RONALDs-MacBook-Pro-2 dev/wordwise ‹workshop*› » gem push wordwise-1.0.4.gem
Pushing gem to https://rubygems.org...
You have enabled multi-factor authentication. Please enter OTP code.
Code:   674233
Successfully registered gem: wordwise (1.0.4)
```

Deleted local copy of gem.

Next, continue with CI/CD issues.
