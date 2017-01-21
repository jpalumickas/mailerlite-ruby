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
See [create a campaign][createACampaign] example.

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

### Groups

####Get list of groups
```ruby
client.groups
```
####Get single group by ID
```ruby
client.group(id)
```
####Create new group
```ruby
client.create_group(name)
```
####Remove a group
```ruby
client.delete_group(id)
```
####Get all subscribers in a specified group
```ruby
client.group_subscribers(id)
```
####Add new single subscriber to specified group
```ruby
subscriber = email: 'subsriber@example.com'
client.create_group_subscriber(1, subscriber)
```
####Add many new subscribers to specified group at once
```ruby
subscribers = [{
	email: 'subscriber1@example.com'
	}, {
	email: 'subscriber2@example.com'
	}
]
client.import_group_subscribers(1, [], resubscribe: true)
```
####Remove single subscriber from specified group
```ruby
client.delete_group_subscriber(group_id, 'demo@mailerlite.com')
```
or
```ruby
client.delete_group_subscriber(group_id, subscriber_id)
```

###Subscribers
####Get single subscriber
```ruby
client.subscriber(id or email)
```
####Update single subscriber
```ruby
client.update_subscriber(id or email, options)
```
options could be:

 - **string**: ```'unsubscribed' or 'active'```
 - **boolean**: indicates whether it is needed to resend autoresponders or not
 - **array**: to be updated fields
 - **hash**: to be updated fields

####Search for subscribers
```ruby
options = { query: 'example',
			limit: 1,
			minimized: true
}
client.search_subscribers(query, options)
```
####Get groups subscriber belongs to
```ruby
client.subscriber_groups(id or email)
```
####Get activity (clicks, opens, etc) of selected subscriber
```ruby
client.subscriber_activities(id or email)
```

###Campaign
####Create campaign where you will use your custom HTML template
```ruby
client.create_campaign()
```
####Upload your HTML template to created campaign
```ruby
client.update_campaign_content(id, options)
```
####Send, schedule or cancel campaign
```ruby
client.campaign_action(id, action)
```
####Returns all campaigns you have in your account by :status which is required. Also basic summary for each campaign including the ID
```ruby
client.campaign_by_status(status)
```
####Remove a campaign
```ruby
client.delete_campaign(id)
```

###Fields
####Get subscriber fields of account
```ruby
client.fields
```
####Create new custom field in account
```ruby
options = { title: 'Title', type: 'TEXT' }
client.create_field(options)
```
####Update custom field in account
```ruby
client.update_field(id, options)
```
options can be either:

 - **string**: Title of the field
 - **hash**: A customizable set of options.
####Remove custom field from account
```ruby
client.delete_field(id)
```

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
[createACampaign]: https://raw.githubusercontent.com/jpalumickas/mailerlite-ruby/master/examples/create_campaign.md

[mailerlite]: https://www.mailerlite.com
