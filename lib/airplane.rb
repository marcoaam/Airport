class Airplane

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
		return puts "It is stormy, you can not take of" if airport.stormy?
		airport.release(to_fly)
	end

	def land_to(airport)
		return puts "It is stormy, you can not land" if airport.stormy?
		airport.receive(to_land) 
	end

end