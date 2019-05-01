require 'docking_station'

describe DockingStation do

  # reset state before each test
  before :each do
    @docking_station = DockingStation.new([])
  end

   it 'has a release_bike method' do
     expect(@docking_station).to respond_to(:release_bike)
   end

   it 'can release a bike' do
     expect(@docking_station.release_bike).to be_an_instance_of(Bike)
   end

   it 'has a dock_bike method' do
     expect(@docking_station).to respond_to(:dock_bike)
   end

   it 'can dock a bike' do
     bike = Bike.new
     @docking_station.dock_bike(bike)
     expect(@docking_station.bikes.length).to eq(1)
     expect(@docking_station.bikes[0]).to eq bike
   end

   it 'requires an argument when initialized' do
     expect(DockingStation).to respond_to(:new).with(1).argument
   end

   it 'can be initialized with bikes' do
     bike_1 = Bike.new
     bike_2 = Bike.new
     docking_station = DockingStation.new([bike_1, bike_2])

     expect(docking_station.bikes.length).to eq(2)
     expect(docking_station.bikes[0]).to eq(bike_1)
     expect(docking_station.bikes[1]).to eq(bike_2)
   end

end
