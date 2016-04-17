module MailerLite
  module Clients
    # Get information about MailerLite Subscribers.
    #
    # You can official documentation at
    # https://docs.mailerlite.com/pages/subscribers
    module Subscribers
      def create_subscriber(list_id, email, options = {})
        options[:email] = email

        connection.post("subscribers/#{list_id}/", options)
      end

      def create_subscribers(list_id, options = {})
        connection.post("subscribers/#{list_id}/import/", options)
      end

      def subscriber(email, options = {})
        options[:email] = email

        connection.get('subscribers/', options)
      end

      def delete_subscriber(list_id, email)
        connection.delete("subscribers/#{list_id}/", email: email)
      end

      def unsubscribe_subscriber(email)
        connection.post('subscribers/unsubscribe/', email: email)
      end
    end
  end
end
