# Fields

## Get subscriber fields of account

```ruby
client.fields
```

## Create new custom field in account

```ruby
options = { title: 'Title', type: 'TEXT' }
client.create_field(options)
```

## Update custom field in account

```ruby
client.update_field(id, title: 'New title')
```

## Remove custom field from account

```ruby
client.delete_field(id)
```
