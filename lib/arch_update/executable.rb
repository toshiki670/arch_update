# frozen_string_literal: true

require 'English'

module ArchUpdate
  module Executable
    def executable?(cmd)
      `type '#{cmd}' > /dev/null 2>&1`.yield_self do
        $CHILD_STATUS.success?
      end
    end
  end
end
