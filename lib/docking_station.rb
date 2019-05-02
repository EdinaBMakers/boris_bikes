class DockingStation
  attr_reader :bikes

  def initialize
    @bikes = []
    @capacity = 20
  end

  def release
    raise RuntimeError, "No bike in the docking station" if @bikes.empty?
    @bikes.first
  end

  def dock(bike)
    raise RuntimeError, "Docking station is full" if @bikes.size == @capacity
    @bikes.push(bike)
  end
end
