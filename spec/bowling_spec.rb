require_relative '../src/bowling'

RSpec.describe Bowling do

    it 'returns zero score when all rolls are misses' do
        bowling = Bowling.new
        zero_scoring_rolls = "-- -- -- -- -- -- -- -- -- --"
        
        expect(bowling.score(zero_scoring_rolls)).to eq(0)
    end
    
end