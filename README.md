# Capistrano::Syncback

Capistrano v3 tasks that can do the following:
  - download/backup files from the server that are not checked into SCM
  - check if files in SCM have changed on the server and download them

## Installation

Add this line to your application's Gemfile:

    gem 'capistrano-syncback'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install capistrano-syncback

## Usage

Require tasks in Capfile:
```ruby
#Capfile
require 'capistrano/syncback'
```
The existing tasks are:
```ruby
cap syncback:files                 # Check sync_files for changes
cap syncback:download              # Download the files
cap syncback:check_and_download    # Check files and download
```

The following capistrano variables exist:
```ruby
set :sync_files, %w{ file1 tmp/file2 } #The files that should be checked
```

## Status

At the moment the sync only works for files and only with git.

**Things planned for the future:**
  - (recursive) syncing of dirs
  - more configuration options
  - support for hg

## Contributing

**Contributions are highly appreciated**

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
