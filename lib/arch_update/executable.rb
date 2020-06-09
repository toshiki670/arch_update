# frozen_string_literal: true

require 'English'
require 'logger'
require 'open3'

module ArchUpdate
  class ExecutableError < StandardError; end

  module Executable
    def executable?(path)
      path = File.split(path).yield_self do |dirname, basename|
        dirname = File.absolute_path?(dirname) ? dirname : ''
        dirname += File::SEPARATOR if dirname.rindex(File::SEPARATOR)
        dirname + basename.split.first
      end

      `type '#{path}' > /dev/null 2>&1`.yield_self do
        $CHILD_STATUS.success?
      end
    end

    def execute(cmd)
      before(cmd)

      Open3.popen3(*args) do |stdin, stdout, stderr, _|
        stdin.close_write

        stdout.each_line do |line|
          ArchUpdate.logger.info { line.chomp }
        end
        stderr.each_line do |line|
          ArchUpdate.logger.error { line.chomp }
        end
      end

      after(status)

      $CHILD_STATUS
    end

    def popen_logger(*args)
      Open3.popen3(*args) do |stdin, stdout, stderr, _|
        stdin.close_write

        stdout.each_line do |line|
          ArchUpdate.logger.info { line.chomp }
        end
        stderr.each_line do |line|
          ArchUpdate.logger.error { line.chomp }
        end
      end
      $CHILD_STATUS
    end

    def execute_table(cmd, title: nil, headings: nil, &block)

      block.call(cmd_result, table) if block_given?
    end

    private

    def before(cmd)
      raise ArchUpdate::ExecutableError unless executable?(cmd)

      ArchUpdate.logger.info do
        '$ ' + cmd.to_s
      end
    end

    def after(status)
      severity = status.success? ? ::Logger::INFO : ::Logger::ERROR
      ArchUpdate.logger.add(severity) do
        'Exit status code: ' + status.exitstatus.to_s
      end
    end
  end
end
