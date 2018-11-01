# frozen_string_literal: true

module MailerLite
  module Clients
    # MailerLite Webhooks
    module Webhooks
      # Get webhooks
      #
      # @see https://developers.mailerlite.com/v2/reference#webhooks-1
      #
      # @return [Hash] Response from API.
      def webhooks
        connection.get('webhooks')
      end

      # Get single webhook
      #
      # @see https://developers.mailerlite.com/v2/reference#webhooksid
      #
      # @param id [Integer] ID of a webhook
      #
      # @return [Hash] Response from API.
      def webhook(id)
        connection.get("webhooks/#{id}")
      end

      # Create webhook
      #
      # @see https://developers.mailerlite.com/v2/reference#webhooks-2
      #
      # @param url [String] Your URL where callbacks are sent.
      # @param event [String] Subscribed event.
      #
      # @return [Hash] Response from API.
      def create_webhook(url, event)
        connection.post('webhooks', url: url, event: event)
      end

      # Update webhook
      #
      # @see https://developers.mailerlite.com/v2/reference#webhooksid-1
      #
      # @param id [Integer] ID of webhook.
      # @param options [Hash] A customizable set of options.
      # @option options [String] :url Your URL where callbacks are sent
      # @option options [String] :event Subscribed event
      #
      # @return [Hash] Response from API.
      def update_webhook(id, options = {})
        connection.put("webhooks/#{id}", options)
      end

      # Remove webhook
      #
      # @see https://developers.mailerlite.com/v2/reference#webhooksid-2
      #
      # @param id [Integer] ID of webhook.
      #
      # @return [Hash] Response from API.
      def delete_webhook(id)
        connection.delete("webhooks/#{id}")
      end
    end
  end
end
