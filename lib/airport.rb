require_relative 'weather'

class Airport

	include Weather

	DEFAULT_CAPACITY = 20

	def initialize(options = {})
		@capacity = options.fetch(:capacity, DEFAULT_CAPACITY)
		@planes ||= []
	end

	def planes
		@planes
	end

	def capacity
		@capacity
	end

	def has_planes?
		planes.any?
	end

	def receive(plane)
		raise 'Airport full, keep flying' if full?
		planes << plane
	end

	def release(plane)
		planes.delete(plane)
	end

	def allow_to_take_of?
		conditions == 'sunny'
	end

	def allow_to_land?
		conditions == 'sunny'
	end

	def full?
		planes.count == capacity
	end

end