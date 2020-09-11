class Bowling

    ALL_PINS = 10

    def score(rolls)
        frames = rolls.split(" ")
        score = 0
        frame_score = 0

        frames.each do |frame|
            frame_score = spare_score(frame_score, frame)
            frame_score += add_frame_pins(frame)
            score = score + frame_score
        end
        
        score
    end

    private

    def spare_score(previous_frame_score, this_frame)    
        spare_score = 0    

        if previous_frame_score == ALL_PINS 
            spare_score = add_frame_pins(this_frame)
        end

        spare_score
    end

    def add_frame_pins(frame)
        frame[0].to_i + frame[1].to_i
    end

end