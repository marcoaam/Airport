class Airplane

	attr_reader :status

	def initialize(status = :flying)
		@status = status
	end

	def land!
		@status = :landed
		self
	end

	def fly!
		@status = :flying
		self
	end

	def take_of_from(airport)
		raise "It is stormy, you can not take of" if airport.stormy?
		airport.release(fly!)
	end

	def land_to(airport)
		raise "It is stormy, you can not land" if airport.stormy?
		airport.receive(land!) 
	end

end