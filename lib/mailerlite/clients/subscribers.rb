module MailerLite
  module Clients
    # Get information about MailerLite Subscribers.
    #
    # @see https://docs.mailerlite.com/pages/subscribers
    module Subscribers
      # Adds a subscriber to an existing subscriber list, including custom
      # field data if supplied. If the subscriber (email address) already
      # exists, their name and any custom field values are updated with
      # whatever is passed in.
      #
      # @see https://docs.mailerlite.com/pages/subscribers#post
      #
      # @param list_id [Integer,String] 	The ID of the subscriber list to
      #   which the subscriber should be added.
      # @param email [String] The email of the subscriber.
      # @param options [Hash] A customizable set of options.
      # @option options [String] :name Name of the subscriber.
      # @option options [Array] :fields Array of custom fields of the
      #   subscriber.
      # @option options [String] :resubscribe Set it to '1', if you want to
      #   reactivate subscriber (default '0').
      #
      # @return [Hash] Response from API.
      def create_subscriber(list_id, email, options = {})
        options[:email] = email

        connection.post("subscribers/#{list_id}/", options)
      end

      # Allows you to add many subscribers to a subscriber list in one API
      # request, including custom field data if supplied.
      # If a subscriber (email address) already exists, their name and any
      # custom field values are updated with whatever is passed in.
      #
      # @see https://docs.mailerlite.com/pages/subscribers#postImport
      #
      # @param list_id [Integer,String] 	The ID of the subscriber list to
      #   which the subscriber should be added.
      # @param options [Hash] A customizable set of options.
      # @option options [Array] :subscribers Array of subscribers.
      # @option options [String] :resubscribe Set it to '1', if you want to
      #   reactivate subscriber (default '0').
      #
      # @return [Hash] Response from API.
      def create_subscribers(list_id, options = {})
        connection.post("subscribers/#{list_id}/import/", options)
      end

      # Retrieves a subscriber's details including their email address, name,
      # active/inactive state, and any custom field data.
      #
      # @see https://docs.mailerlite.com/pages/subscribers#get
      #
      # @param email [String] The email address of the subscriber whose details
      #   should be retrieved.
      # @param options [Hash] A customizable set of options.
      # @option options [Boolean] :history Set to true if you want to get
      #   historical records of campaigns and autoresponder emails received
      #   by a subscriber (default - false).
      #
      # @return [Hash] Response from API.
      def subscriber(email, options = {})
        options[:email] = email

        connection.get('subscribers/', options)
      end

      # Removes subscriber from the group. He will no longer receive campaigns
      # sent to this group.
      #
      # @see https://docs.mailerlite.com/pages/subscribers#delete
      #
      # @param list_id [Integer, String] The ID of the subscriber list to which
      #   the subscriber should be added.
      # @param email [String] The email of the subscriber.
      #
      # @return [Hash] Response from API.
      def delete_subscriber(list_id, email)
        connection.delete("subscribers/#{list_id}/", email: email)
      end

      # Marks subscriber as unsubscribed. He will no longer receive any
      # campaigns.
      #
      # @see https://docs.mailerlite.com/pages/subscribers#postUnsubscribe
      #
      # @param email [String] The email of the subscriber.
      #
      # @return [Hash] Response from API.
      def unsubscribe_subscriber(email)
        connection.post('subscribers/unsubscribe/', email: email)
      end
    end
  end
end
