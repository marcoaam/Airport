require 'weather'

shared_examples_for 'a weather tracker' do
	
	let(:weather) { described_class.new }
	let(:random_number) { double :number}

	it 'has a random number between 0 and 1' do
		expect(weather).to receive(:rand).with(2)
		weather.random_number
	end

	it 'returns a random number' do
		allow(weather).to receive(:rand).with(2).and_return(1)
		expect(weather.random_number).to eq 1
	end

	it 'generates random weather conditions stormy or not stormy' do
		allow(weather).to receive(:rand).with(2).and_return(1)
		expect(weather).to be_stormy
	end

	it 'generates random weather conditions stormy or not stormy' do
		allow(weather).to receive(:rand).with(2).and_return(0)
		expect(weather).not_to be_stormy
	end

end