require_relative '../src/bowling'

RSpec.describe Bowling do

    it "returns zero score when all rolls are misses" do
        bowling = Bowling.new
        zero_scoring_rolls = "-- -- -- -- -- -- -- -- -- --"
        expected_score = 0

        expect(bowling.score(zero_scoring_rolls)).to eq(expected_score)
    end

    expected_scores_no_spares_no_strikes = {
        "44 44 44 44 44 44 44 44 44 44" => 80,
        "22 22 22 22 22 22 22 22 22 22" => 40,
        "12 34 54 63 72 -- 9- 6- 8- 1-" => 61
    }

    expected_scores_no_spares_no_strikes.each do |rolls, score|
        it "adds rolls in '#{rolls}' to score #{score}, because all rolls knock some (but not all) pins down" do
            bowling = Bowling.new            
            expect(bowling.score(rolls)).to eq(score)
        end
    end

    expected_scores_with_spares_no_strikes = {
        "55 44 44 44 44 44 44 44 44 44" => 10 + 4 + (9 * 8),
        "55 55 44 44 44 44 44 44 44 44" => (10 * 2) + (5 + 4) + (8 * 8),
        "44 44 55 55 44 44 44 44 44 44" => (10 * 2) + (5 + 4) + (8 * 8),
        "44 44 46 91 44 44 44 44 44 44" => (10 * 2) + (9 + 4) + (8 * 8),
        "42 62 37 14 55 91 33 28 11 11" => (1 + 9 + 3 + 1) + (6 + 8 + 10 + 5 + 10 + 10 + 6 + 10 + 2 + 2),
        "46 -2 37 41 55 91 3- 28 -- 11" => (0 + 4 + 9 + 3 + 0) + (10 + 2 + 10 + 5 + 10 + 10 + 3 + 10 + 0 + 2)
    }

    expected_scores_with_spares_no_strikes.each do |rolls, score|
        it "adds ten to the score, plus pins from the next frame, when all pins felled in one frame: '#{rolls}'" do
            bowling = Bowling.new            
            expect(bowling.score(rolls)).to eq(score)
        end
    end

    expected_scores_with_strikes_no_spares = {
        "X 44 44 44 44 44 44 44 44 44" => 10 + 8 + (9*8)
    }

    expected_scores_with_strikes_no_spares.each do |rolls, score|
        it "adds ten to the score, plus pins from the next two frames, when there is a strike: '#{rolls}'" do
            bowling = Bowling.new            
            expect(bowling.score(rolls)).to eq(score)
        end
    end
    
end