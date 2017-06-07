module MailerLite
  module Clients
    # MailerLite Campaigns
    module Campaigns
      # Create campaign where you will use your custom HTML template
      #
      # @see https://developers.mailerlite.com/v2/reference#campaigns
      #
      # @param options [Hash] A customizable set of options.
      # @option options [String] :type Type of campaign. Available values:
      #   regular, ab.
      # @option options [String] :subject Mail subject. Required if campaign
      #   type is regular.
      # @option options [String] :from Email of sender
      # @option options [String] :from_name Name of sender
      # @option options [String] :language ISO 639-1
      # @option options [Array] :groups IDs of groups
      # @option options [Hash] :ab_settings Required if campaign type is ab.
      #
      # @return [Hash] Response from API.
      def create_campaign(options = {})
        connection.post('campaigns', options)
      end

      # Upload your HTML template to created campaign
      #
      # @see https://developers.mailerlite.com/v2/reference#put-custom-content-to-campaign
      #
      # @param id [Integer] ID of campaign
      # @param options [Hash] A customizable set of options.
      # @option options [String] :html HTML template source
      # @option options [String] :plain Plain text of email
      # @option options [Boolean] :auto_inline Defines if it is needed to
      #   convert available CSS to inline CSS (excluding media queries)
      #
      # @return [Hash] Response from API.
      def update_campaign_content(id, options = {})
        connection.put("campaigns/#{id}/content", options)
      end

      # Send, schedule or cancel campaign
      #
      # @see https://developers.mailerlite.com/v2/reference#campaign-actions-and-triggers
      #
      # @param id [Integer] ID of campaign
      # @param action [String] Action type. Possible values: send, cancel
      #
      # @return [Hash] Response from API.
      def campaign_action(id, action)
        connection.post("campaigns/#{id}/actions/#{action}")
      end

      # Returns all campaigns you have in your account by :status which is
      # required. Also basic summary for each campaign including the ID.
      #
      # @see https://developers.mailerlite.com/v2/reference#campaigns-by-type
      #
      # @param status [String] possible values: 'sent', 'outbox', 'draft'
      # no value means 'sent'
      #
      # @return Response from API.
      def campaigns_by_status(status)
        connection.get("campaigns/#{status}")
      end

      # Remove a campaign.
      #
      # @see https://developers.mailerlite.com/v2/reference#delete-campaign
      #
      # @param id [Integer] id of campaign
      #
      # @return [Boolean] Response from API.
      def delete_campaign(id)
        connection.delete("campaigns/#{id}")
      end
    end
  end
end
