# MailerLite API v2 Ruby wrapper

A Ruby gem which helps to communicate with [MailerLite][mailerlite] API.

[![Gem Version](http://img.shields.io/gem/v/mailerlite.svg?style=flat-square)][rubygems]
[![Build Status](http://img.shields.io/travis/jpalumickas/mailerlite-ruby.svg?style=flat-square)][travis]
[![Dependency Status](http://img.shields.io/gemnasium/jpalumickas/mailerlite-ruby.svg?style=flat-square)][gemnasium]
[![Coverage Status](http://img.shields.io/coveralls/jpalumickas/mailerlite-ruby/master.svg?style=flat-square)][coveralls]
[![Code Climate](http://img.shields.io/codeclimate/github/jpalumickas/mailerlite-ruby.svg?style=flat-square)][codeclimate]

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'mailerlite'
```

## Usage

Before making any request, you should authenticate first. Use the response object to
make requests afterward.
See [create a campaign][create_a_campaign] example.

### Authentication

When you sign up for an account, you are given an **API key**. You authenticate to
the [MailerLite][mailerlite] API by providing your API key in the request.
You can find your API key in page: Integrations » Developer API.

```ruby
client = MailerLite::Client.new(api_key: 'my-secret-api-key')
```

Or create file under `config/initializers/mailerlite.rb`

```ruby
MailerLite.configure do |config|
  config.api_key = 'my-secret-api-key'
end
```

See more documentation in [examples][examples] directory.

## Supported Ruby Versions

This library aims to support and is [tested against][travis] the following Ruby
implementations:

* Ruby 2.0.0
* Ruby 2.1.0
* Ruby 2.2.0
* Ruby 2.3.0
* Ruby 2.4.0

## Copyright
Copyright (c) 2017 Justas Palumickas. See [LICENSE][license] for details.

[rubygems]: https://rubygems.org/gems/mailerlite
[travis]: http://travis-ci.org/jpalumickas/mailerlite-ruby
[gemnasium]: https://gemnasium.com/jpalumickas/mailerlite-ruby
[coveralls]: https://coveralls.io/r/jpalumickas/mailerlite-ruby
[codeclimate]: https://codeclimate.com/github/jpalumickas/mailerlite-ruby

[license]: https://raw.githubusercontent.com/jpalumickas/mailerlite-ruby/master/LICENSE
[create_a_campaign]: https://raw.githubusercontent.com/jpalumickas/mailerlite-ruby/master/examples/create_campaign.md
[examples]: https://github.com/jpalumickas/mailerlite-ruby/tree/master/examples

[mailerlite]: https://www.mailerlite.com
