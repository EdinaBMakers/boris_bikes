require 'docking_station'

describe DockingStation do

  # reset state before each test
  before :each do
    @docking_station = DockingStation.new
  end

   it 'has a release method' do
     expect(@docking_station).to respond_to(:release)
   end

   it 'can release a bike when bike available' do
     bike = Bike.new
     @docking_station.dock(bike)

     expect(@docking_station.release).to eq bike
   end

   it 'has a dock method' do
     expect(@docking_station).to respond_to(:dock)
   end

   it 'raises error when trying to release a bike and docking station is empty' do
     expect{@docking_station.release}.to raise_error('No bike available')
   end

   it 'raises error when trying to release a bike and only broken ones available' do
     bike = Bike.new
     bike.report_broken
     @docking_station.dock(bike)

     expect{@docking_station.release}.to raise_error('No bike available')
   end

   it 'can dock a working bike' do
     bike = Bike.new
     @docking_station.dock(bike)

     expect(@docking_station.bikes.size).to eq(1)
     expect(@docking_station.bikes[0]).to eq bike
   end

   it 'can dock a broken bike' do
     bike = Bike.new
     bike.report_broken
     @docking_station.dock(bike)

     expect(@docking_station.bikes.size).to eq(1)
     expect(@docking_station.bikes[0]).to eq(bike)
   end

   it 'requires an argument when initialized' do
     expect(DockingStation).to respond_to(:new).with(1).argument
   end

   # Given docking station is full (Setup)
   # When I try to dock a bikes (Act)
   # Then I get an error (Assert)
   it 'raises error when docking station with default capacity is at max capacity' do
     DockingStation::DEFAULT_CAPACITY.times {@docking_station.dock(Bike.new)}

     expect{@docking_station.dock(Bike.new)}.to raise_error('Docking station is full')
   end

   it 'raises error when docking station with custom capacity is at max capacity' do
     custom_capacity = DockingStation::DEFAULT_CAPACITY + 10
     docking_station = DockingStation.new(custom_capacity)
     custom_capacity.times {docking_station.dock(Bike.new)}

     expect{docking_station.dock(Bike.new)}.to raise_error('Docking station is full')
   end

   it 'is empty when initialized' do
     expect(@docking_station.bikes).to be_empty
   end


end
