# Boris Bikes Challenge

## Description
London's [Boris Bike] (https://tfl.gov.uk/modes/cycling/santander-cycles) are awesome. The aim of this challenge to implement Boris Bikes, a network of docking stations and bikes that anyone can use.

## User Stories

```
As a person,
So that I can use a bike,
I'd like a docking station to release a bike.

As a person,
So that I can use a good bike,
I'd like to see if a bike is working

As a member of the public
So I can return bikes I've hired
I want to dock my bike at the docking station

As a member of the public
So I can decide whether to use the docking station
I want to see a bike that has been docked

As a member of the public,
So that I am not confused and charged unnecessarily,
I'd like docking stations not to release bikes when there are none available.

As a maintainer of the system,
So that I can control the distribution of bikes,
I'd like docking stations not to accept more bikes than their capacity.

As a system maintainer,
So that I can plan the distribution of bikes,
I want a docking station to have a default capacity of 20 bikes.

As a system maintainer,
So that busy areas can be served more effectively,
I want to be able to specify a larger capacity when necessary.

As a member of the public,
So that I reduce the chance of getting a broken bike in future,
I'd like to report a bike as broken when I return it.

As a maintainer of the system,
So that I can manage broken bikes and not disappoint users,
I'd like docking stations not to release broken bikes.

As a maintainer of the system,
So that I can manage broken bikes and not disappoint users,
I'd like docking stations to accept returning bikes (broken or not).

```

## Getting Started

1. Clone this repo to your local machine using `git@github.com:EdinaBMakers/boris_bikes.git`

## Objects

#### DockingStation

This class represents a docking station. It is responsible for storing, releasing and docking bikes. 

#### Bike

This class represents a bike and can track its condition.

## Usage

Run `irb` in the terminal and execute the following statements:

```
2.6.0 :001 > require "./lib/docking_station.rb"
 => true 
2.6.0 :002 > require "./lib/bike.rb"
 => true 

 # Creates a docking station
2.6.0 :003 > docking_station = DockingStation.new
 => #<DockingStation:0x00007f95a78c00e8 @bikes=[], @capacity=20> 

 # Creates a bike
2.6.0 :004 > bike = Bike.new
 => #<Bike:0x00007f95a7884480 @working=true> 

 # Checks if the bike is working by default
2.6.0 :005 > bike.working?
 => true 

 # Docks a bike into the docking station
2.6.0 :006 > docking_station.dock(bike)
 => [#<Bike:0x00007f95a7884480 @working=true>] 

 # Docking station releases a bike
2.6.0 :007 > docking_station.release
 => #<Bike:0x00007f95a7884480 @working=true> 

 # Reports a bike as broken
2.6.0 :008 > bike.report_broken
 => false 

 # Docking station accepts a broken bike
2.6.0 :009 > docking_station.dock(bike)
 => [#<Bike:0x00007fbe0c1559b0 @working=false>] 

 # Docking station cannot relese a bike, because the only one in the station is broken
2.6.0 :010 > docking_station.release
Traceback (most recent call last):
        5: from /Users/edinabolkeny/.rvm/rubies/ruby-2.6.0/bin/irb:23:in `<main>'
        4: from /Users/edinabolkeny/.rvm/rubies/ruby-2.6.0/bin/irb:23:in `load'
        3: from /Users/edinabolkeny/.rvm/rubies/ruby-2.6.0/lib/ruby/gems/2.6.0/gems/irb-1.0.0/exe/irb:11:in `<top (required)>'
        2: from (irb):10
        1: from /Users/edinabolkeny/Projects/boris_bikes/lib/docking_station.rb:11:in `release'
RuntimeError (No bike available)

# The broken bike is still in the docking station
2.6.0 :011 > docking_station.bikes
 => [#<Bike:0x00007fbe0c1559b0 @working=false>] 

```

## Testing

#### Running Tests

Tests can be run from the root directory using the `rspec` command.