# frozen_string_literal: true

require 'optparse'
require 'arch_update/pacman'

module ArchUpdate
  # The OptionParser's wrapper
  class OptionParser < ::OptionParser
    PARSERS = [
      ArchUpdate::Pacman
    ].freeze

    def check
      PARSERS.each do |parser|
        unless parser.include? ArchUpdate::OptionParseable
          raise ArchUpdate::OptionParseableError
        end
      end
    end

    def build
      self.version = ArchUpdate::VERSION

      PARSERS.each do |parser|
        parser.addon self
      end 
    end
  end
end
