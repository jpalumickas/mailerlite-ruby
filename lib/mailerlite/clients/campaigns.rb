module MailerLite
  module Clients
    # Get information about MailerLite Campaigns.
    #
    # You can view official documentation at
    # https://developers.mailerlite.com/docs/campaigns
    module Campaigns
      def create_campaign(options = {})
        connection.post('campaigns', options)
      end

      def update_campaign_content(id, options = {})
        connection.put("campaigns/#{id}/content", options)
      end

      def campaign_action(id, action, options = {})
        connection.post("campaigns/#{id}/actions/#{action}", options)
      end
    end
  end
end
