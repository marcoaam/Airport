require_relative 'weather'

class Airport

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

	def allow_to_land?
		!stormy?
	end

	def full?
		planes.count == capacity
	end

end