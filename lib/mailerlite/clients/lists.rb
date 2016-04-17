module MailerLite
  module Clients
    module Lists
      def lists(options = {})
        connection.get('lists/', options)
      end

      def list(id)
        connection.get("lists/#{id}")
      end

      def create_list(name)
        connection.post('lists/', name: name)
      end

      def update_list(id, name)
        connection.post("lists/#{id}", name: name)
      end

      def delete_list(id)
        connection.delete("lists/#{id}")
      end

      def list_active_subscribers(id, options = {})
        connection.get("lists/#{id}/active", options)
      end

      def list_unsubscribed_subscribers(id, options = {})
        connection.get("lists/#{id}/unsubscribed", options)
      end

      def list_bounced_subscribers(id, options = {})
        connection.get("lists/#{id}/bounced", options)
      end
    end
  end
end
