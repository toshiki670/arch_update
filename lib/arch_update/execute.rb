# frozen_string_literal: true

require 'cmd_executable'
require 'English'
require 'logger'
require 'open3'

module ArchUpdate
  class ExecuteError < StandardError; end

  # Execute tools
  class Execute
    include CmdExecutable

    def initialize(command, env = {}, options = {})
      @command = command
      @env = env
      @options = options
    end

    def execute
      before

      Open3.popen3(env, @command, options) do |stdin, stdout, stderr, wait_thr|
        yield(stdin, stdout, stderr, wait_thr) if block_given?
        stdin.close if stdin.closed?
      end

      after

      $CHILD_STATUS
    end

    def execute_logger
      execute do |stdin, stdout, stderr, _|
        stdin.close_write

        std_logger(stdout, Logger::INFO)
        std_logger(stderr, Logger::ERROR)
      end
    end

    def execute_table(title: nil, headings: nil, &block)
      p title
      p headings
      block.call(cmd_result, table) if block_given?
    end

    private

    def before
      raise ArchUpdate::ExecuteError unless executable?(@command.to_s)

      ArchUpdate.logger.info do
        '$ ' + @command.to_s
      end
    end

    def after
      severity = $CHILD_STATUS.success? ? ::Logger::INFO : ::Logger::ERROR
      ArchUpdate.logger.add(severity) do
        'Exit status code: ' + status.exitstatus.to_s
      end
    end

    def std_logger(io, level: Logger::DEBUG)
      io.each_line { |line| ArchUpdate.logger.add(level) { line.chomp } }
    end
  end
end
