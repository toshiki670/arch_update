# frozen_string_literal: true

require 'spec_helper'

# rubocop:disable Metrics/BlockLength

RSpec.describe 'ArchUpdate::VERSION' do
  version_types = %i[
    major_version
    minor_version
    revision_version
    invalid_last_space
  ].freeze

  let(:version) { ArchUpdate::VERSION }
  let(:split_version) { version.split('.') }

  version_types.each_with_index do |version_type, idx|
    let(version_type) { split_version[idx] }
  end

  context 'when full version types' do
    subject { version }
    it "It's version exists" do
      is_expected.to be_truthy
    end
  end

  version_types[..-2].each do |version_type|
    context "when #{version_type}" do
      subject { method(version_type).call }
      it "It isn't nil" do
        is_expected.to be_truthy
      end
      it "It's numeric" do
        is_expected.to be_match(/\A\d+\Z/)
      end
    end
  end

  context 'when invalid last space' do
    subject { invalid_last_space }
    it "It's nil" do
      is_expected.to be_nil
    end
  end
end
# rubocop:enable Metrics/BlockLength
