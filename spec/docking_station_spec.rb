require 'docking_station'

describe DockingStation do

  # reset state before each test
  before :each do
    @docking_station = DockingStation.new
  end

   it 'has a release_bike method' do
     expect(@docking_station).to respond_to(:release_bike)
   end

   it 'can release a bike' do
     expect(@docking_station.release_bike).to be_an_instance_of(Bike)
   end
end
