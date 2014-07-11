require 'airport'

describe Airport do

	 let(:airport) { Airport.new }
	 let(:plane) { double :plane }

  it 'is has a no planes landed when created' do
  	expect(airport.planes). to eq []
  end

  it 'has a default capacity of 20 when created' do
  	expect(airport.capacity).to eq 20
  end

  it 'can be created with a custom caoacity' do
  	custom_airport = Airport.new(capacity: 30)
  	expect(custom_airport.capacity).to eq 30
  end

  it 'Knows if it have planes' do
  	expect(airport).not_to have_planes
  end

  it 'can receive airplanes that are landing' do
 		airport.receive(plane)
 		expect(airport.planes).to eq [plane]
  end

  it 'can release planes that want to take of' do
  	airport.receive(plane)
  	airport.release(plane)
  	expect(airport).not_to have_planes
  end

  it 'is not full without any planes' do
  	expect(airport).not_to be_full
  end

  it 'is full when a number of planes has landed' do
  	(airport.capacity).times { airport.planes << plane }
  	expect(airport).to be_full
  end

  it 'doest allow the plane to land if it is full' do
  	(airport.capacity).times { airport.planes << plane }
		expect{airport.receive(plane)}.to raise_error(RuntimeError)
  end

end