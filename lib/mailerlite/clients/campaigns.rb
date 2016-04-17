module MailerLite
  module Clients
    # Get information about MailerLite Campaigns.
    #
    # You can official documentation at
    # https://docs.mailerlite.com/pages/campaigns
    module Campaigns
      def campaigns(options = {})
        connection.get('campaigns/', options)
      end

      def campaign(id)
        connection.get("campaigns/#{id}/")
      end

      def campaign_recipients(id, options = {})
        connection.get("campaigns/#{id}/recipients/", options)
      end

      def campaign_opens(id, options = {})
        connection.get("campaigns/#{id}/opens/", options)
      end

      def campaign_clicks(id, options = {})
        connection.get("campaigns/#{id}/clicks/", options)
      end

      def campaign_unsubscribes(id, options = {})
        connection.get("campaigns/#{id}/unsubscribes/", options)
      end

      def campaign_bounces(id, options = {})
        connection.get("campaigns/#{id}/bounces/", options)
      end

      def campaign_junk(id, options = {})
        connection.get("campaigns/#{id}/junk/", options)
      end
      alias campaign_spam_complaints campaign_junk
    end
  end
end
