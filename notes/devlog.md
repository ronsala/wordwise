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
