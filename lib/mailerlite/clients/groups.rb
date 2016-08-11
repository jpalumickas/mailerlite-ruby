module MailerLite
  module Clients
    # Get information about MailerLite Lists.
    #
    # You can official documentation at
    # https://developers.mailerlite.com/docs/groups
    module Groups
      def groups
        connection.get('groups')
      end

      def group(id)
        result = connection.get("groups/#{id}")
        result.is_a?(Array) ? result[0] : result
      end

      def create_group(name)
        connection.post('groups', name: name)
      end

      def update_group(id, options = {})
        connection.put("groups/#{id}", options)
      end

      def delete_group(id)
        connection.delete("groups/#{id}")
      end

      def group_subscribers(group_id, options = {})
        connection.get("groups/#{group_id}/subscribers", options)
      end

      def create_group_subscriber(group_id, options = {})
        connection.post("groups/#{group_id}/subscribers", options)
      end

      def import_group_subscribers(group_id, subscribers, options = {})
        options[:subscribers] = subscribers
        connection.post("groups/#{group_id}/subscribers/import", options)
      end

      def delete_group_subscriber(group_id, subscriber_id_or_email)
        connection.delete(
          "groups/#{group_id}/subscribers/#{subscriber_id_or_email}"
        )
      end
    end
  end
end
