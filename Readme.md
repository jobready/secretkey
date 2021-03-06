# SecretKey

[![Code Climate](https://codeclimate.com/github/jobready/secretkey/badges/gpa.svg)](https://codeclimate.com/github/jobready/secretkey)
[![Test Coverage](https://codeclimate.com/github/jobready/secretkey/badges/coverage.svg)](https://codeclimate.com/github/jobready/secretkey)

Ruby Gem for generating a unique access token when provided with an application id, application secret and timestamp

## Installation

Add this line to your application's Gemfile:

    gem 'secretkey'

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install secretkey

## Usage

To generate a token, simply run this method:

    secretkey = SecretKey::SecretKey.new(key, secret)
    token = secretkey.token

SecretKey will automatically generate a timestamp, which can be accessed by running:

    secretkey.timestamp

Alternatively, you can specify your own timestamp:

    timestamp = Time.now.to_i

    secretkey = SecretKey::SecretKey.new(key, secret, timestamp: timestamp)
    token = secretkey.token

Where:

* `key` - application key
* `secret` - application secret
* `timestamp` - an epoch timestamp in seconds i.e. 2014-07-24 14:03:30 +1000 would be 1406174610 in epoch format

## Style guidelines

We try to adhere to the following coding style guidelines

  * https://github.com/styleguide/ruby
  * https://github.com/bbatsov/rails-style-guide
  * https://github.com/bbatsov/ruby-style-guide

## Contributing

1. Fork it ( http://github.com/jobready/secretkey/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
