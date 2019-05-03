require 'bike'

describe Bike do

  # reset state before each test
  before :each do
    @bike = Bike.new
  end

  it 'has a working? method' do
    expect(@bike).to respond_to(:working?)
  end

  it 'is working when not reported as broken' do
    expect(@bike.working?).to eq(true)
  end

  # Given a bike is reported as broken (Setup)
  # When I check if it is working (Act)
  # Then I get false (Assert)
  it 'is not working when reported as broken' do
    @bike.report_broken
    expect(@bike.working?).to eq(false)
  end
end
