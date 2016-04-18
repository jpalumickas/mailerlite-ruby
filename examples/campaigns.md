# Campaigns

## Get all campaigns

Returns all campaigns you have in your account.
Also basic summary for each campaign including the ID.

#### Example:

```ruby
client.campaigns
```

You can specify **limit** and **page** options:

```ruby
client.campaings(limit: 200, page: 2)
```

## Campaign details

Retrieve stats about selected campaign with specified ID.

#### Example:

```ruby
campaign_id = 123
client.campaign(campaign_id)
```

## Campaign recipients

Retrieves a paged result representing all the subscribers that a given campaign was sent to.

#### Example:

```ruby
client.campaign_recipients(123)
```

You can specify **limit** and **page** options:

```ruby
client.campaing_recipients(123, limit: 200, page: 2)
```


## Campaign opens

Retrieves a paged result representing all the subscribers that opened a given campaign.

#### Example:

```ruby
client.campaign_opens(123)
```

You can specify **limit** and **page** options:

```ruby
client.campaing_opens(123, limit: 200, page: 2)
```
