# Authentication Example

When you sign up for an account, you are given an **API key**. You authenticate to
the [MailerLite][mailerlite] API by providing your API key in the request.
You can find your API key in page: Integrations » Developer API.

## Using variable

```ruby
client = MailerLite::Client.new(api_key: 'my-secret-api-key')
```

Example:

```ruby
client.campaigns
```

## Using global class config

Or create file under `config/initializers/mailerlite.rb`

```ruby
MailerLite.configure do |config|
  config.api_key = 'my-secret-api-key'
end
```

When you configured in file, you can request methods on `MailerLite` class
directly.

Example:

```ruby
MailerLite.campaigns
```
