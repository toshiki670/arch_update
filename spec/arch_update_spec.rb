# frozen_string_literal: true

RSpec.describe ArchUpdate do
  it 'has a version number' do
    expect(ArchUpdate::VERSION).not_to be nil
  end
end
