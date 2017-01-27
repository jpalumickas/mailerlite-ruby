#Create Campaign Example

##1. Authentication
See [Developer API](https://app.mailerlite.com/integrations/api/) and find **API Key** there.
```ruby
client = MailerLite::Client.new(api_key: 'my-secret-api-key')
```

##2. Create a group
create a group indicating the receivers.
```ruby
group = client.create_group('example_group')
```
##3. Add user to the created group
```ruby
client.create_group_subscriber(group.id, { email: 'an@example.com',
fields: {name: 'An Example'}})
```
##4. Create a campaign with created group
```ruby
campaign = client.create_campaign type: 'regular',
    subject: 'Newsletter',
    from: 'john_smith@example.com',
    from_name: 'John Smith',
    groups: [ group.id ],
    language: 'en'
```
##5. Put content in the campaign
```ruby
html = "<div>Welcome,<br /><a href=\"{$unsubscribe}\">Unsubscribe</a></div>"
plain_text = 'Welcome, {$unsubscribe} {$url}'
client.update_campaign_content(campaign.id, html: html, plain: plain_text )
```
`${url}` must be exist in plain text.
`${unsubscribe}` must be exist in both plain text and html. See the [API documentation](http://developers.mailerlite.com/reference#put-custom-content-to-campaign).

##6. Send the campaign
```ruby
client.campaign_action(campaign.id, 'send')
```
hint: According to current API, you may not resend a campaign.
note: Currently, setting campaigns language parameter to "fa" for "Farsi" language causes an Internal Server Error on "send campaign" requests, use "pr" instead.
