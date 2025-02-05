# MailerLite API v1 Ruby wrapper

A Ruby gem which helps to communicate with [MailerLite][mailerlite] API.

[![Gem Version](https://img.shields.io/gem/v/mailerlite.svg?style=flat-square)][rubygems]
[![Coverage Status](https://img.shields.io/codecov/c/github/jpalumickas/mailerlite-ruby?style=flat-square)][codecov]

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

Example:

```ruby
client.groups
```

Or create file under `config/initializers/mailerlite.rb`

```ruby
MailerLite.configure do |config|
  config.api_key = 'my-secret-api-key'
  # config.timeout = 10
end
```

When you configured global settings in file, then you can request methods
on `MailerLite` class directly.

Example:

```ruby
MailerLite.campaigns
```

See more documentation in [examples][examples] directory.

## Supported Ruby Versions

This library aims to support and is [tested against][github_actions] the following Ruby
implementations:

* Ruby 2.7.0
* Ruby 3.0.0
* Ruby 3.1.0
* Ruby 3.2.0
* Ruby 3.3.0
* Ruby 3.4.0
* Truffleruby

## License

The gem is available as open source under the terms of the [MIT License][license].

[rubygems]: https://rubygems.org/gems/mailerlite
[codecov]: https://codecov.io/gh/jpalumickas/mailerlite-ruby
[github_actions]: https://github.com/jpalumickas/mailerlite-ruby/actions

[license]: https://raw.githubusercontent.com/jpalumickas/mailerlite-ruby/master/LICENSE
[create_a_campaign]: https://raw.githubusercontent.com/jpalumickas/mailerlite-ruby/master/examples/create_campaign.md
[examples]: https://github.com/jpalumickas/mailerlite-ruby/tree/master/examples

[mailerlite]: https://www.mailerlite.com
