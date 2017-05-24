# Inventory

Simple inventory management webapp originally designed for
[PolyJapan](https://polyjapan.epfl.ch/). It was build using
[Ruby on Rails](http://rubyonrails.org/).

## Deployment (Dev)

You obviously need ruby (and rubygem). You may want to take a look
to [rubyinstall.org](http://rubyinstaller.org/) or
[railsinstaller.org](http://rubyinstaller.org/) if you're running on windows.

```
# First clone this repo
git clone git@github.com:Polyjapan/inventory.git
cd inventory

# Install dependencies
bundle install --path vendor/bundle

# Create database (use sqlite3 by default)
rake db:create

# Run migrations
rake db:migrate

# Create default user
rake db:seed

# Run!
rails server

# The app should now be available on 127.0.0.1:3000.
```
