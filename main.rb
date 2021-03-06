# frozen_string_literal: true
require "pry-byebug"
require "csv"

questions = CSV.read("questions.csv", headers: true)
ratings = CSV.read("ratings.csv", headers: true)
muppets = CSV.read("muppets.csv", headers: true).map {|row| row.to_hash }
ratings_values = CSV.read("ratings_values.csv", headers: true).map {|row| row.to_hash }

def print_instructions
  puts "On a scale of 1 to 5, please indicate how much you agree with each of the following statements."
  puts "Strongly Disagree | Disagree | Neutral | Agree | Strongly Agree"
  puts "       1          |     2    |    3    |   4   |       5       "
end

def calculate_result(responses, ratings_values, muppets)
  responses.each do |response|
    question = response[:question]
    answer = response[:answer]

    result = ratings_values.find {|row| row["question_id"] == question.to_s && row["rating_id"] == answer.to_s }

    if result
      muppets.map do |m|
        if m["id"].to_s == result["muppet_id"].to_s
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

# sample_responses = [{:question=>"1", :answer=>3}, {:question=>"2", :answer=>1}, {:question=>"3", :answer=>2}, {:question=>"4", :answer=>3}, {:question=>"5", :answer=>4}, {:question=>"6", :answer=>2}, {:question=>"7", :answer=>3}]
# larger_sample_responses = [{:question=>"1", :answer=>1}, {:question=>"2", :answer=>2}, {:question=>"3", :answer=>3}, {:question=>"4", :answer=>4}, {:question=>"5", :answer=>5}, {:question=>"6", :answer=>1}, {:question=>"7", :answer=>3}, {:question=>"8", :answer=>4}, {:question=>"9", :answer=>1}, {:question=>"10", :answer=>3}, {:question=>"11", :answer=>4}, {:question=>"12", :answer=>5}, {:question=>"13", :answer=>1}, {:question=>"14", :answer=>2}, {:question=>"15", :answer=>3}, {:question=>"16", :answer=>4}, {:question=>"17", :answer=>3}, {:question=>"18", :answer=>2}, {:question=>"19", :answer=>3}, {:question=>"20", :answer=>4}, {:question=>"21", :answer=>2}, {:question=>"22", :answer=>4}, {:question=>"23", :answer=>5}, {:question=>"24", :answer=>3}, {:question=>"25", :answer=>2}, {:question=>"26", :answer=>3}, {:question=>"27", :answer=>4}, {:question=>"28", :answer=>1}, {:question=>"29", :answer=>2}, {:question=>"30", :answer=>3}]
# caras_responses = [{:question=>"1", :answer=>5}, {:question=>"2", :answer=>2}, {:question=>"3", :answer=>4}, {:question=>"4", :answer=>2}, {:question=>"5", :answer=>5}, {:question=>"6", :answer=>1}, {:question=>"7", :answer=>5}, {:question=>"8", :answer=>5}, {:question=>"9", :answer=>4}, {:question=>"10", :answer=>4}, {:question=>"11", :answer=>3}, {:question=>"12", :answer=>4}, {:question=>"13", :answer=>1}, {:question=>"14", :answer=>3}, {:question=>"15", :answer=>5}, {:question=>"16", :answer=>4}, {:question=>"17", :answer=>2}, {:question=>"18", :answer=>4}, {:question=>"19", :answer=>2}, {:question=>"20", :answer=>4}, {:question=>"21", :answer=>1}, {:question=>"22", :answer=>2}, {:question=>"23", :answer=>2}, {:question=>"24", :answer=>3}, {:question=>"25", :answer=>2}, {:question=>"26", :answer=>4}, {:question=>"27", :answer=>4}, {:question=>"28", :answer=>2}, {:question=>"29", :answer=>5}, {:question=>"30", :answer=>5}]
# result = calculate_result(caras_responses, ratings_values, muppets)

print_instructions
responses = []

questions.each do |row|
  puts "* " + row["question"] + " *"
  answer = gets.chomp.to_i

  while !answer.between?(1, 5) do
    puts "That is an invalid input. Please provide a response between 1 and 5."
    answer = gets.chomp.to_i
  end

  responses.push({ question: row[row.headers.first], answer: answer})
end

result = calculate_result(responses, ratings_values, muppets)

puts "=====Your result is:====="
puts result["label"]
puts result["description"]
puts result["count"]



