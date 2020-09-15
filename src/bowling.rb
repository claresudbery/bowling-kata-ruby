class Bowling

    ALL_PINS = 10
    STRIKE = "X"

    def score(rolls)
        frames = rolls.split(" ")
        score = 0

        for index in 0...10
            frame_pin_sum = sum_frame_pins(frames[index])
            strike_score = strike_score(frames[index], frames[index+1], frames[index+2])
            spare_score = spare_score(frames[index], frames[index+1])

            score = score + strike_score + spare_score + frame_pin_sum
        end
        
        score
    end

    private

    def strike_score(this_frame, next_frame, frame_after_next)    
        strike_score = 0    

        if this_frame == STRIKE 
            strike_score = sum_frame_pins(next_frame)
            if next_frame == STRIKE 
                strike_score = strike_score + first_frame_pin(frame_after_next)
            end
        end

        strike_score
    end

    def spare_score(this_frame, next_frame)    
        spare_score = 0    

        if this_frame != STRIKE && sum_frame_pins(this_frame) == ALL_PINS 
            spare_score = first_frame_pin(next_frame)
        end

        spare_score
    end

    def sum_frame_pins(frame)
        frame == STRIKE \
            ? ALL_PINS \
            : frame[0].to_i + frame[1].to_i
    end

    def first_frame_pin(frame)
        frame == STRIKE \
            ? ALL_PINS \
            : frame[0].to_i
    end

end