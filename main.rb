# frozen_string_literal: true
require "pry-byebug"
require "csv"

questions = CSV.read("questions.csv", headers: true)
ratings = CSV.read("ratings.csv", headers: true)
muppets = CSV.read("muppets.csv", headers: true)
ratings_values = CSV.read("ratings_values.csv", headers: true)

def print_instructions
  puts "On a scale of 1 to 5, please indicate how much you agree with each of the following statements."
  puts "Strongly Disagree | Disagree | Neutral | Agree | Strongly Agree"
  puts "       1          |     2    |    3    |   4   |       5       "
end

# loop through questions
print_instructions
answers = []

questions.each do |row|
  puts "* " + row["question"] + " *"
  answer = gets.chomp.to_i

  while !answer.between?(1, 5) do
    puts "That is an invalid input. Please provide a response between 1 and 5."
    answer = gets.chomp.to_i
  end

  answers.push(answer)
end

puts "The answers are: " + answers



