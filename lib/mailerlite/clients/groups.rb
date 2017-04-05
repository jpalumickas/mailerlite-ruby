module MailerLite
  module Clients
    # MailerLite Groups
    module Groups
      # Get list of groups
      #
      # @see https://developers.mailerlite.com/docs/groups
      #
      # @return [Array] Response from API.
      def groups
        connection.get('groups')
      end

      # Get single group by ID
      #
      # @see http://developers.mailerlite.com/reference#single-group
      #
      # @param id [Integer] Id of group
      #
      # @return [Hash] Response from API.
      def group(id)
        result = connection.get("groups/#{id}")
        result.is_a?(Array) ? result[0] : result
      end

      # Create new group
      #
      # @see http://developers.mailerlite.com/reference#create-group
      #
      # @param name [String] Name of your group
      #
      # @return [Hash] Response from API.
      def create_group(name)
        connection.post('groups', name: name)
      end

      def update_group(id, options = {})
        connection.put("groups/#{id}", options)
      end

      # Remove group
      #
      # @see http://developers.mailerlite.com/reference#delete-group
      #
      # @param [Integer] Id of group
      #
      # @return [Boolean] Response from API.
      def delete_group(id)
        connection.delete("groups/#{id}")
      end

      # Get all subscribers in a specified group
      #
      # @see http://developers.mailerlite.com/reference#subscribers-in-a-group
      #
      # @param group_id [Integer] Id of group
      # @param options [Hash] Request options
      #
      # @return [Array] Subscribers
      def group_subscribers(group_id, options = {})
        connection.get("groups/#{group_id}/subscribers", options)
      end

      # Add new single subscriber to specified group
      #
      # @see http://developers.mailerlite.com/reference#add-single-subscriber
      #
      # @param group_id [Integer] Id of group
      # @param options [Hash] Request options
      #
      # @return [Hash] Response from API
      def create_group_subscriber(group_id, options = {})
        connection.post("groups/#{group_id}/subscribers", options)
      end

      # Add many new subscribers to specified group at once
      #
      # @see http://developers.mailerlite.com/reference#add-many-subscribers
      #
      # @param group_id [Integer] Id of group
      # @param subscribers [Array] Array of hash each indicates a subscriber
      # @param options [Hash] Request options
      #
      # @return [Hash] Response from API.
      def import_group_subscribers(group_id, subscribers, options = {})
        options[:subscribers] = subscribers
        connection.post("groups/#{group_id}/subscribers/import", options)
      end

      # Remove single subscriber from specified group
      #
      # @see http://developers.mailerlite.com/reference#remove-subscriber
      #
      # @param group_id [Integer|String] Id of group
      # @param subscriber_id_or_email [Array] Id or email of subscriber
      #
      # @return [Hash] Response from API.
      def delete_group_subscriber(group_id, subscriber_id_or_email)
        escaped_subscriber_id_or_email = CGI.escape(subscriber_id_or_email)
        connection.delete(
          "groups/#{group_id}/subscribers/#{escaped_subscriber_id_or_email}"
        )
      end
    end
  end
end
