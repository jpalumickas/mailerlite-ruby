# frozen_string_literal: true

require 'hashie/mash'

module MailerLite
  class Mash < Hashie::Mash
    disable_warnings
  end
end
