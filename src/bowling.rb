class Bowling

    ALL_PINS = 10

    def score(rolls)
        frames = rolls.split(" ")
        score = 0
        item_score = 0

        frames.each do |frame|
            item_score = spare_score(item_score, frame)
            item_score += add_frame_pins(frame)
            score = score + item_score
        end
        
        score
    end

    private

    def spare_score(previous_frame_score, this_frame)        
        spare_score = (previous_frame_score == ALL_PINS) ? add_frame_pins(this_frame) : 0
    end

    def add_frame_pins(frame)
        frame[0].to_i + frame[1].to_i
    end

end