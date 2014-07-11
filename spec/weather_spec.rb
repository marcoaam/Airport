require 'weather'

shared_examples_for 'a weather tracker' do
	
	let(:weather) { described_class.new }
	let(:random_number) { double :number}

	it 'has a weather conditions' do
		weather.conditions
	end

	it 'has 2 weather states sunny and stormy' do
		expect(weather.states).to eq ['sunny', 'stormy']
	end

	xit 'has a random status' do
		expect(weather).to receive(:states).with(:[]).and_return(random_number)
		weather.conditions
	end

end