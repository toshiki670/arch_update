# frozen_string_literal: true

RSpec.describe 'ArchUpdate::VERSION' do
  let(:split_version) { ArchUpdate::VERSION.split('.') }
  let(:major_version) { split_version[0] }
  let(:minor_version) { split_version[1] }
  let(:revision_version) { split_version[2] }
  let(:invalid_last_space) { split_version[3] }

  it 'has a version number' do
    expect(ArchUpdate::VERSION).to be_truthy
  end

  %i[major_version minor_version revision_version].each do |version|
    context "when #{version}" do
      subject { method(version).call }
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
