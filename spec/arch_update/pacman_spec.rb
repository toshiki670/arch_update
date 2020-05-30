# frozen_string_literal: true

require 'English'

# rubocop:disable Metrics/BlockLength

RSpec.describe ArchUpdate::Pacman do
  let(:child_status_mock) do
    `:`.yield_self do
      $CHILD_STATUS
    end
  end

  let(:option_parser_mock) do
    double('Option parser mock').tap do |opm|
      allow(opm).to receive(:on) 
    end

  end

  let(:instance) do
    ArchUpdate::Pacman.new.tap do |pacman|
      allow(pacman).to receive(:execute).and_return(child_status_mock)
    end
  end

  describe '.addon(option_parser)' do
    subject { ArchUpdate::Pacman.addon(option_parser_mock) }
    it 'is expected not to raise NotImplementedError' do
      expect { subject }.not_to raise_error
    end

  end

  describe '#list' do
    subject { instance.list }
    it do
      should be_success
    end
  end

  describe '#update' do
    subject { instance.list }
    it do
      should be_success
    end
  end
end
# rubocop:enable Metrics/BlockLength
