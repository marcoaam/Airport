class Airplane

	def initialize(status = 'flying')
		@status = status
	end

	def status
		@status
	end

	def to_land
		@status = 'landed'
		self
	end

	def to_fly
		@status = 'flying'
		self
	end

	def take_of_from(airport)
		airport.release(to_fly) if airport.allow_to_take_of?
	end

	def land_to(airport)
		airport.receive(to_land) if airport.allow_to_land?
	end

end