# frozen_string_literal: true

module MailerLite
  module Clients
    # MailerLite Fields
    module Fields
      # Get subscriber fields of account
      #
      # @see https://developers.mailerlite.com/v2/reference#all-fields
      #
      # @return [Array] Response from API.
      def fields
        connection.get('fields')
      end

      # Create new custom field in account
      #
      # @see https://developers.mailerlite.com/v2/reference#create-field
      #
      # @param options [Hash] A customizable set of options.
      # @option options [String] :title Title of field
      # @option options [String] :type Type of field. Available values:
      #   TEXT, INTEGER, DATE
      #
      # @return [Hash] Response from API.
      def create_field(options = {})
        connection.post('fields', options)
      end

      # Update custom field in account
      #
      # @see https://developers.mailerlite.com/v2/reference#update-field
      #
      # @param id [Integer] ID of field.
      # @param options [Hash] A customizable set of options.
      # @option options [String] :title Title of field
      #
      # @return [Hash] Response from API.
      def update_field(id, options = {})
        connection.put("fields/#{id}", options)
      end

      # Remove custom field from account
      #
      # @see https://developers.mailerlite.com/v2/reference#remove-field
      #
      # @param id [Integer] ID of field.
      #
      # @return [Hash] Response from API.
      def delete_field(id)
        connection.delete("fields/#{id}")
      end
    end
  end
end
