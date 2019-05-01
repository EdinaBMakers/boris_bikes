require 'bike'

describe Bike do

  # reset state before each test
  before :each do
    @bike = Bike.new
  end

  it 'has a working? method' do
    expect(@bike).to respond_to(:working?)
  end

  it 'is working' do
    expect(@bike.working?).to eq(true)
  end
end
