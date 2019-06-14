class DockingStation
  attr_reader :bikes
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release
    raise RuntimeError, "No bike available" if empty? || all_broken?
    @bikes.shift
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

  def all_broken?
    @bikes.all?{ |bike| !bike.working?}
  end
end
