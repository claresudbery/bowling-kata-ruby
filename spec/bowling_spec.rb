require_relative '../src/bowling'

RSpec.describe Bowling do

    it 'returns zero score when all rolls are misses' do
        bowling = Bowling.new
        zero_scoring_rolls = "-- -- -- -- -- -- -- -- -- --"

        expect(bowling.score(zero_scoring_rolls)).to eq(0)
    end

    expected_scores = {
        "44 44 44 44 44 44 44 44 44 44" => 80
        "22 22 22 22 22 22 22 22 22 22" => 40
    }

    expected_scores.each do |rolls, score|
        it 'adds #{rolls} to create #{score}, because all rolls knock some (but not all) pins down' do
            bowling = Bowling.new            
            expect(bowling.score(rolls)).to eq(score)
        end
    end
    
end