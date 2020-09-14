class Bowling

    ALL_PINS = 10
    STRIKE = "X"

    def score(rolls)
        frames = rolls.split(" ")
        score = 0
        prev_frame = ""

        frames.each do |frame|
            strike_score = strike_score(prev_frame, frame)
            spare_score = spare_score(prev_frame, frame)
            frame_pin_sum = sum_frame_pins(frame)
            score = score + strike_score + spare_score + frame_pin_sum
            prev_frame = frame
        end
        
        score
    end

    private

    def strike_score(prev_frame, this_frame)    
        strike_score = 0    

        if prev_frame == STRIKE 
            strike_score = sum_frame_pins(this_frame)
        end

        strike_score
    end

    def spare_score(prev_frame, this_frame)    
        spare_score = 0    

        if prev_frame != STRIKE && sum_frame_pins(prev_frame) == ALL_PINS 
            spare_score = this_frame[0].to_i
        end

        spare_score
    end

    def sum_frame_pins(frame)
        frame == STRIKE ? ALL_PINS : frame[0].to_i + frame[1].to_i
    end

end