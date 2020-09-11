require_relative '../src/bowling'

RSpec.describe Bowling do

    it 'creates a Bowling class' do
        bowling = Bowling.new
        expect(bowling).to be_kind_of(Bowling)
    end

    it 'returns zero score when all rolls are misses' do
        bowling = Bowling.new
        expect(bowling.score("-- -- -- -- -- -- -- -- -- --")).to eq(0)
    end
    
end