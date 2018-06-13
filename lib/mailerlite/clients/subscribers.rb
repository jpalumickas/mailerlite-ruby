module MailerLite
  module Clients
    # MailerLite Subscribers
    module Subscribers
      # Get single subscriber
      #
      # @see https://developers.mailerlite.com/v2/reference#single-subscriber
      #
      # @param identifier [Integer,String] ID or email of subscriber.
      #
      # @return [Hash] Response from API.
      def subscriber(identifier)
        connection.get("subscribers/#{identifier}")
      end

      # Create subscriber
      #
      # @see https://developers.mailerlite.com/v2/reference#create-a-subscriber
      #
      # @param identifier [Integer,String] ID or email of subscriber.
      # @param params [Hash] Params list. See more in MailerLite docs.
      # @option options [String] :email Required. Email of new subscriber.
      # @option options [String] :name Subscriber name.
      #
      # @return [Hash] Response from API.
      def create_subscriber(params = {})
        connection.post('subscribers', params)
      end

      # Update single subscriber
      #
      # @see https://developers.mailerlite.com/v2/reference#update-subscriber
      #
      # @param identifier [Integer,String] ID or email of subscriber.
      # @param options [Hash] A customizable set of options.
      # @option options [Array] :fields Associated array where key is the same
      #   as field key.
      # @option options [String] :type Available values: unsubscribed, active
      # @option options [Boolean] :resend_autoresponders Defines if it is
      #   needed to resend autoresponders
      #
      # @return [Hash] Response from API.
      def update_subscriber(identifier, options = {})
        connection.put("subscribers/#{identifier}", options)
      end

      # Search for subscribers
      #
      # @see https://developers.mailerlite.com/v2/reference#search-for-subscribers
      #
      # @param query [String] Search query
      # @param options [Hash] A customizable set of options.
      # @option options [Integer] :offset
      # @option options [Integer] :limit
      # @option options [Boolean] :minimized
      #
      # @return [Array] Response from API.
      def search_subscribers(query, options = {})
        options[:query] = query
        connection.get('subscribers/search', options)
      end

      # Get groups subscriber belongs to
      #
      # @see https://developers.mailerlite.com/v2/reference#groups-subscriber-belongs-to
      #
      # @param identifier [Integer,String] ID or email of subscriber.
      #
      # @return [Array] Response from API.
      def subscriber_groups(identifier)
        connection.get("subscribers/#{identifier}/groups")
      end

      # Get activity (clicks, opens, etc) of selected subscriber
      #
      # @see https://developers.mailerlite.com/v2/reference#activity-of-single-subscriber
      #
      # @param identifier [Integer,String] ID or email of subscriber.
      #
      # @return [Array] Response from API.
      def subscriber_activities(identifier)
        connection.get("subscribers/#{identifier}/activity")
      end
      alias subscriber_activity subscriber_activities
    end
  end
end
