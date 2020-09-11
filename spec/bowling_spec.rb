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
        "12 34 54 63 72 -- 9- 6- 8- 1-" => 61
    }

    expected_scores.each do |rolls, score|
        it "adds rolls in '#{rolls}' to score #{score}, because all rolls knock some (but not all) pins down" do
            bowling = Bowling.new            
            expect(bowling.score(rolls)).to eq(score)
        end
    end

    it "adds ten to the score, plus pins from the next frame, when all pins are knocked down in one frame" do
        bowling = Bowling.new
        one_spare = "55 44 44 44 44 44 44 44 44 44"
        expected_score = 10 + 8 + (8 * 9)

        expect(bowling.score(one_spare)).to eq(expected_score)
    end
    
end