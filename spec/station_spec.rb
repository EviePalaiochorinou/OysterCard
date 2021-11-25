require 'station'

describe Station do
  it 'returns its name' do
    expect(described_class.new("Brixton", 1).name).to eq "Brixton"
  end

  it 'returns its zone' do
    expect(described_class.new("Brixton", 1).zone).to eq 1
  end
end