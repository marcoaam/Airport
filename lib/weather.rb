module Weather

	def states
		['sunny', 'stormy']
	end

	def conditions
		states[rand(2)]
	end

end