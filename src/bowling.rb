class Bowling

    def score(rolls)
        frames = rolls.split(" ")
        score = 0

        frames.each do |item|
            item_score = item[0].to_i + item[1].to_i
            score = score + item_score
        end
        
        score
    end

end