# frozen_string_literal: true

require 'arch_update/executable'
require 'arch_update/option_parseable'

module ArchUpdate
  class Pacman
    include ArchUpdate::Executable
    include ArchUpdate::OptionParseable

    SHORT = '-p'
    LONG = '--pacman'
    DESC = 'Update pacman.'

    def self.addon(option_parser)
      opt.on(SHORT, LONG, DESC) do |value|
        list if value
      end
    end

    def list
      execute('checkupdates')
    end

    def update
      execute('sudo pacman -Syu --noconfirm')
    end
  end
end
