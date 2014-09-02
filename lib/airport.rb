require_relative 'weather'

class Airport

  include Weather

  attr_reader :hangar, :capacity

  DEFAULT_CAPACITY = 20

  def initialize(options = {})
    @capacity = options.fetch(:capacity, DEFAULT_CAPACITY)
    @hangar ||= []
  end

  def has_planes?
    hangar.any?
  end

  def release(plane)
    hangar.delete(plane)
  end

  def receive(plane)
    if full?
      take_of_all_planes
      puts 'Airport full, All planes trying to take of of weather is not stormy'
    else
      hangar << plane
    end
  end

  def full?
    hangar.count >= capacity
  end

  def take_of_all_planes
    hangar.each { |plane| plane.take_of_from(self) }
  end

end