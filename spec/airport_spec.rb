require 'airport'

describe Airport do

	let(:airport)       { Airport.new    }
	let(:plane)         { double :plane, to_fly: true  }
	let(:random_number) { double :number }

  it 'is has a no planes landed when created' do
  	expect(airport.hangar). to eq []
  end

  it 'has a default capacity of 20 when created' do
  	expect(airport.capacity).to eq 20
  end

  it 'can be created with a custom caoacity' do
  	custom_airport = Airport.new(capacity: 30)
  	expect(custom_airport.capacity).to eq 30
  end

  it 'Knows if it has planes' do
  	expect(airport).not_to have_planes
  end

  it 'can receive airplanes that are landing' do
 		airport.receive(plane)
 		expect(airport.hangar).to eq [plane]
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
  	(airport.capacity).times { airport.hangar << plane }
  	expect(airport).to be_full
  end

  it 'doesnt allow the plane to land and calls take of for all planes if it is full (raises error) ' do
  	(airport.capacity).times { airport.receive(plane) }

		expect(airport).to receive(:take_of_all_planes)
		expect(airport).to receive(:puts).with('Airport full, All planes trying to take of of weather is not stormy')
    airport.receive(plane)
  end

  it 'Tries to make all planes take off if the weather is not stormy' do
    airport.receive(plane)
    expect(plane).to receive(:take_of_from).with(airport)
  	airport.take_of_all_planes
  end

  context 'Weather' do

    it 'has a random number between 0 and 1' do
  		expect(airport).to receive(:rand).with(6)
  		airport.random_number
  	end

  	it 'returns a random number' do
  		allow(airport).to receive(:rand).with(6).and_return(1)
  		expect(airport.random_number).to eq 1
  	end

  	it 'generates random airport conditions stormy' do
  		allow(airport).to receive(:rand).with(6).and_return(1)
  		expect(airport).to be_stormy
  	end

  	it 'generates random airport conditions not stormy' do
  		allow(airport).to receive(:rand).with(6).and_return(3)
  		expect(airport).not_to be_stormy
  	end

  end

end