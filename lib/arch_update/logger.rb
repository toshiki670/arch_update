# frozen_string_literal: true

require 'delegate'
require 'singleton'
require 'logger'

module ArchUpdate
  # Singleton Logger
  class Logger < Delegator
    include Singleton

    DEFAULT_LEVEL = ::Logger::Severity::INFO

    attr_reader :base

    def initialize
      init(STDOUT, level: DEFAULT_LEVEL)
    end

    def init(...)
      @base = ::Logger.new(...)
      nil
    end

    def is_a?(*args)
      @base.is_a?(*args) || super(*args)
    end

    private

    def default_output
      "./#{Time.new.strftime('%F_%T')}.log"
    end

    def __getobj__
      @base
    end

    def __setobj__(base)
      @base = base
    end
  end
end
