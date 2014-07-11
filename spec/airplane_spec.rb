require 'airplane'

describe Airplane do

	let(:plane)        { Airplane.new          }
	let(:landed_plane) { Airplane.new(:landed) }
	let(:airport)      { double :airport       }

	it 'has a flying status when created' do
		expect(plane.status).to eq :flying
	end

	it 'has a flying status when is flying' do
		plane.to_fly
		expect(plane.status).to eq :flying
	end

	it 'has a landed status when is not flying' do
		plane.to_land
		expect(plane.status).to eq :landed
	end

	it 'can take off' do
		expect(airport).to receive(:release).with(plane)
		expect(airport).to receive(:stormy?).and_return(false)
		plane.take_of_from(airport)
	end

	it 'is flying after take of' do
		allow(airport).to receive(:release).with(landed_plane)
		allow(airport).to receive(:stormy?).and_return(false)

		landed_plane.take_of_from(airport)

		expect(landed_plane.status).to eq :flying
	end

	it 'it can not take of if the weather doesnt allow to' do
		allow(airport).to receive(:stormy?).and_return(true)

		landed_plane.take_of_from(airport)

		expect(landed_plane.status).to eq :landed
	end

	it 'can land' do
		expect(airport).to receive(:receive).with(plane)
		expect(airport).to receive(:stormy?).and_return(false)
		plane.land_to(airport)
	end

	it 'can not land if the weather doesnt allow to' do
		allow(airport).to receive(:receive).with(plane)
		expect(airport).to receive(:stormy?).and_return(true)
		plane.land_to(airport)
		expect(plane.status).to eq :flying
	end

end