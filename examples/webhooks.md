# Webhooks

## Get all webhooks

```ruby
client.webhooks
```

## Get single webhook

```ruby
client.webhook(1)
```

## Create webhook

```ruby
client.create_webhook('example.com', 'event')
```

## Update webhook

```ruby
client.update_webhook(1, event: 'event')
```

## Remove webhook

```ruby
client.delete_webhook(1)
```
