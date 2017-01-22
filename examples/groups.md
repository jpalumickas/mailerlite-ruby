# Groups Examples

## Get list of groups

```ruby
client.groups
```

## Get single group by ID

```ruby
client.group(group_id)
```

## Create new group

```ruby
client.create_group(name)
```

## Remove a group
```ruby
client.delete_group(group_id)
```

## Get all subscribers in a specified group

```ruby
client.group_subscribers(group_id)
```

## Add new single subscriber to specified group

```ruby
subscriber = { email: 'subsriber@example.com' }
client.create_group_subscriber(1, subscriber)
```

## Add many new subscribers to specified group at once

```ruby
subscribers = [
  { email: 'subscriber1@example.com' },
  { email: 'subscriber2@example.com' }
]

client.import_group_subscribers(1, subscribers, resubscribe: true)
```

## Remove single subscriber from specified group

```ruby
client.delete_group_subscriber(group_id, 'demo@mailerlite.com')
```

or

```ruby
client.delete_group_subscriber(group_id, subscriber_id)
```
