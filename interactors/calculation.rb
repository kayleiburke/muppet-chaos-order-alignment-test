class Calculation
  def calculate_result(responses, ratings_values, muppets) # (responses, quiz)
    responses.each do |response|
      question = response[:question]
      answer = response[:answer]

      result = ratings_values.find {|row| row["question_id"] == question.to_s && row["rating_id"] == answer.to_s }

      score = Hash.new(0)
      if result
        muppets.map do |m|
          if m["id"].to_s == result["muppet_id"].to_s
            score["muppet"] = result["label"]
            score["count"] = score["count" + 1]

            if m["count"]
              m["count"] = m["count"] + result["value"].to_i
            else
              m["count"] = result["value"].to_i
            end
          end
          m
        end
      end
    end

    puts muppets.map {|m| [m["label"], m["count"]] }
    muppets.max_by{|m| m["count"] }
  end
end