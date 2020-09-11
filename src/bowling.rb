class Bowling

    def score(rolls)
        frames = rolls.split(" ")
        score = 0

        frames.each do |frame|
            item_score = add_frame_pins(frame)
            score = score + item_score
        end
        
        score
    end

    private

    def add_frame_pins(frame)
        frame[0].to_i + frame[1].to_i
    end

end