# Campaigns

## Create campaign where you will use your custom HTML template

```ruby
client.create_campaign
```

## Upload your HTML template to created campaign

```ruby
client.update_campaign_content(id, options)
```

## Send, schedule or cancel campaign

```ruby
client.campaign_action(id, action)
```

## Returns all campaigns you have in your account by :status which is required. Also basic summary for each campaign including the ID

```ruby
client.campaign_by_status(status)
```

with options

```ruby
client.campaign_by_status(:sent, order: :desc, limit: 5, offset: 10)
```


## Remove a campaign

```ruby
client.delete_campaign(id)
```
