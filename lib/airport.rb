require_relative 'weather'

class Airport

	include Weather

	attr_reader :planes, :capacity

	DEFAULT_CAPACITY = 20

	def initialize(options = {})
		@capacity = options.fetch(:capacity, DEFAULT_CAPACITY)
		@planes ||= []
	end

	def has_planes?
		planes.any?
	end

	def release(plane)
		planes.delete(plane)
	end

	def receive(plane)
		if full?
			take_of_all_planes
		else
			planes << plane
		end
	end

	def full?
		planes.count >= capacity
	end

	def take_of_all_planes
			planes.each { |plane| plane.take_of_from(self) }
	end

end