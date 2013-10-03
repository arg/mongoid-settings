class Settings
  include Mongoid::Settings
  setting :some_integer, type: Integer, default: 100
end

describe Mongoid::Settings do
  before do
    Settings.reload!
  end

  it 'fills settings with their default values' do
    expect(Settings.some_integer).to eq(100)
  end

  it 'allows to set values' do
    Settings.some_integer = 200
    expect(Settings.some_integer).to eq(200)
  end

  describe '[]' do
    it 'returns correct values' do
      expect(Settings[:some_integer]).to eq(100)
    end

    it 'returns nil for non-existent settings' do
      expect(Settings[:other]).to be_nil
    end
  end

  describe '[]=' do
    it 'correctly sets the new value' do
      Settings[:some_integer] = 300
      expect(Settings[:some_integer]).to eq(300)
    end

    it "doesn't set value for non-existent setting" do
      Settings[:other] = 'test'
      expect(Settings[:other]).to be_nil
    end
  end
end
