# frozen_string_literal: true

module ArchUpdate
  class OptionParseableError < StandardError; end

  module OptionParseable
    def self.included(base)
      base.extend ClassMethods
    end

    module ClassMethods
      def addon(option_parser)
        raise NotImplementedError
      end
    end
  end
end
