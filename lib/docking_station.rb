class DockingStation
  attr_reader :bikes
  DEFAULT_CAPACITY = 20

  def initialize
    @bikes = []
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
    @bikes.size >= DEFAULT_CAPACITY
  end

  def empty?
    @bikes.empty?
  end
end
