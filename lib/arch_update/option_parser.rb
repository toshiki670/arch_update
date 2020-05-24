# frozen_string_literal: true

require 'optparse'

module ArchUpdate
  # The OptionParser's wrapper
  class OptionParser < ::OptionParser
    def build
      self.version = ArchUpdate::VERSION
    end
  end
end
