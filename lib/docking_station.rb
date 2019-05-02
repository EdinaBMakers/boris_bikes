class DockingStation
  attr_reader :bikes

  def initialize
    @bikes = []
    @capacity = 20
  end

  def release
    raise RuntimeError, "No bike in the docking station" if empty?
    @bikes.first
  end

  def dock(bike)
    raise RuntimeError, "Docking station is full" if full?
    @bikes.push(bike)
  end

  private

  def full?
    @bikes.size >= @capacity
  end

  def empty?
    @bikes.empty?
  end
end
