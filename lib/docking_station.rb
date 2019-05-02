class DockingStation
  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def release
    raise RuntimeError, "No bike in the docking station" if @bikes.empty?
    @bikes.first
  end

  def dock(bike)
    raise RuntimeError, "Docking station is full" if @bikes.any?
    @bikes.push(bike)
  end
end
