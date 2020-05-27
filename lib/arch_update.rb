# frozen_string_literal: true

require 'arch_update/executable'
require 'arch_update/logger'
require 'arch_update/option_parseable'
require 'arch_update/option_parser'
require 'arch_update/version'

module ArchUpdate
  class Error < StandardError; end

  class << self
    def start
      parser = ArchUpdate::OptionParser.new
      parser.build
      parser.parse! ARGV
    end

    def logger
      ArchUpdate::Logger.instance
    end

    def logger_init(*args)
      ArchUpdate::Logger.instance.init(*args)
    end
  end
end
