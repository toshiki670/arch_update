# frozen_string_literal: true

require 'spec_helper'

RSpec.describe ArchUpdate::Execute do
  let(:instance) { ArchUpdate::Execute.new(command) }

  describe '#execute(cmd, &block)' do
    subject { instance }
  end
  describe '#execute_table(cmd)' do
    subject { instance.execute_table(cmd) }
    context '' do
    end
  end
  describe '#execute_show(cmd)' do
    subject { instance }
  end
  describe '#execute_logger(cmd)' do
    subject { instance }
  end
end
