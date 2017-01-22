# Subscribers

## Get single subscriber

```ruby
client.subscriber(subscriber_id)
```

or with email

```ruby
client.subscriber('user@example.com')
```

## Update single subscriber

```ruby
client.update_subscriber(subscriber_id options)
```

or with email

```ruby
client.update_subscriber('user@example.com', options)
```

`options` can be:

- `fields` [Array]: Associated array where key is the same as field key.
- `type` [String]: Available values: `unsubscribed`, `active`
- `resend_autoresponders` [Boolean]: Defines if it is needed to resend autoresponders

## Search for subscribers

```ruby
options = {
  query: 'example',
  limit: 1,
  minimized: true
}

client.search_subscribers(query, options)
```

## Get groups subscriber belongs to

```ruby
client.subscriber_groups(subscriber_id)
```

or with email

```ruby
client.subscriber_groups('user@example.com')
```

## Get activites (clicks, opens, etc.) of selected subscriber
```ruby
client.subscriber_activities(subscriber_id)
```

or with email

```ruby
client.subscriber_activities('user@example.com')
```
