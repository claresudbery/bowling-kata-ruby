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
        "55 44 44 44 44 44 44 44 44 44" => 10 + 4 + (9*8),
        "55 55 44 44 44 44 44 44 44 44" => (10*2) + (5+4) + (8*8),
        "44 44 55 55 44 44 44 44 44 44" => (10*2) + (5+4) + (8*8),
        "44 44 46 91 44 44 44 44 44 44" => (10*2) + (9+4) + (8*8),
        "42 62 37 14 55 91 33 28 11 11" => (1+9+3+1) + (6+8+10+5+10+10+6+10+2+2),
        "46 -2 37 41 55 91 3- 28 -- 11" => (0+4+9+3+0) + (10+2+10+5+10+10+3+10+0+2)
    }

    expected_scores_with_spares_no_strikes.each do |rolls, score|
        it "adds ten to the score, plus pins from the next roll, when all pins felled in one frame: '#{rolls}'" do
            bowling = Bowling.new            
            expect(bowling.score(rolls)).to eq(score)
        end
    end

    expected_scores_with_strikes_no_spares = {
        "X 44 44 44 44 44 44 44 44 44" => 10 + 8 + (9*8),
        "X 44 X 44 44 44 44 44 44 44" => (10*2) + (8+8) + (8*8),
        "44 44 X 44 X 44 44 44 44 44" => (10*2) + (8+8) + (8*8),
        "42 62 X 14 X 11 X 33 X 11" => (5+2+6+2) + (6+8+10+5+10+2+10+6+10+2),
        "4- -2 X 14 X 11 X 33 X --" => (5+2+6+0) + (4+2+10+5+10+2+10+6+10+0),
        "X -2 X 41 X 81 3- X -- 11" => (2+5+9+0) + (10+2+10+5+10+9+3+10+0+2)
    }

    expected_scores_with_strikes_no_spares.each do |rolls, score|
        it "adds ten to the score, plus pins from the next two rolls, when there is a strike: '#{rolls}'" do
            bowling = Bowling.new            
            expect(bowling.score(rolls)).to eq(score)
        end
    end

    expected_scores_with_strikes_and_spares = {
        "X 44 55 44 X 44 55 44 X 44" => (10*5) + (8+8+8) + (4+4) + (8*5)
    }

    expected_scores_with_strikes_and_spares.each do |rolls, score|
        it "adds pins only for the relevant scores when there is a mixture of strikes and spares: '#{rolls}'" do
            bowling = Bowling.new            
            expect(bowling.score(rolls)).to eq(score)
        end
    end
    
end