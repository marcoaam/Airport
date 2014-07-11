require_relative 'weather'

class Airplane

	include Weather

	def initialize(status = :flying)
		@status = status
	end

	def status
		@status
	end

	def to_land
		@status = :landed
		self
	end

	def to_fly
		@status = :flying
		self
	end

	def take_of_from(airport)
		airport.release(to_fly) unless stormy?
	end

	def land_to(airport)
		airport.receive(to_land) unless stormy?
	end

end