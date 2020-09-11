require_relative '../src/bowling'

RSpec.describe Bowling do

    it "returns zero score when all rolls are misses" do
        bowling = Bowling.new
        zero_scoring_rolls = "-- -- -- -- -- -- -- -- -- --"
        expected_score = 0

        expect(bowling.score(zero_scoring_rolls)).to eq(expected_score)
    end

    expected_scores = {
        "44 44 44 44 44 44 44 44 44 44" => 80,
        "22 22 22 22 22 22 22 22 22 22" => 40,
        "12 34 56 78 91 23 45 67 89 12" => 93
    }

    expected_scores.each do |rolls, score|
        it "adds rolls in '#{rolls}' to score #{score}, because all rolls knock some (but not all) pins down" do
            bowling = Bowling.new            
            expect(bowling.score(rolls)).to eq(score)
        end
    end
    
end