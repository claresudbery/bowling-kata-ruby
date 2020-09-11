class Bowling

    ALL_PINS = 10

    def score(rolls)
        frames = rolls.split(" ")
        score = 0
        frame_pin_sum = 0

        frames.each do |frame|
            spare_score = spare_score(frame_pin_sum, frame)
            frame_pin_sum = sum_frame_pins(frame)
            score = score + spare_score + frame_pin_sum
        end
        
        score
    end

    private

    def spare_score(previous_frame_pin_sum, this_frame)    
        spare_score = 0    

        if previous_frame_pin_sum == ALL_PINS 
            spare_score = sum_frame_pins(this_frame)
        end

        spare_score
    end

    def sum_frame_pins(frame)
        frame[0].to_i + frame[1].to_i
    end

end