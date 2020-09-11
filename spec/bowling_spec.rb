require_relative '../src/bowling'

RSpec.describe Bowling do

    it 'returns zero score when all rolls are misses' do
        bowling = Bowling.new
        zero_scoring_rolls = "-- -- -- -- -- -- -- -- -- --"

        expect(bowling.score(zero_scoring_rolls)).to eq(0)
    end

    it 'adds pins to create score, when all rolls knock some (but not all) pins down' do
        bowling = Bowling.new
        zero_scoring_rolls = "44 44 44 44 44 44 44 44 44 44"
        
        expect(bowling.score(zero_scoring_rolls)).to eq(80)
    end
    
end