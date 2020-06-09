# frozen_string_literal: true

require 'arch_update/executable'

# rubocop:disable Metrics/BlockLength

RSpec.describe ArchUpdate::Executable do
  class Klass
    include ArchUpdate::Executable
  end

  let(:instance) { Klass.new }

  describe '#executable?(path)' do
    subject { instance }
    context 'With absolute path' do
      it "It's valid" do
        is_expected.to be_executable '/usr/sbin/ls'
      end
      it "It's invalid" do
        is_expected.to_not be_executable '/usr/sbin/hoge_invalid'
      end
    end
    context 'Without path' do
      it "It's valid" do
        is_expected.to be_executable 'ls'
      end
      it "It's invalid" do
        is_expected.to_not be_executable 'hoge_invalid'
      end
    end
  end
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

# rubocop:enable Metrics/BlockLength
