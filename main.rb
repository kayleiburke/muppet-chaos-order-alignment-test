# frozen_string_literal: true
require "pry-byebug"
require "csv"
require "active_support/inflector"

Dir["models/*.rb", "interactors/*.rb"].each {|file| require_relative file }

def get_instructions
  [
      "On a scale of 1 to 5, please indicate how much you agree with each of the following statements.",
      "Strongly Disagree | Disagree | Neutral | Agree | Strongly Agree" ,
      "       1          |     2    |    3    |   4   |       5       "
  ]
end

def print_responses(responses)
  responses.each_with_index do |response, index|
    puts (index + 1).to_s + ". " + response[:question].label
    puts response[:answer].label
  end
end

quiz_hash = {
    id: 1,
    description: "My Quiz",
    instructions: get_instructions,
    questions: ObjectCreator.new.perform("Question"),
    choices: ObjectCreator.new.perform("Choice"),
    outcomes: ObjectCreator.new.perform("Outcome"),
    choices_outcomes: ObjectCreator.new.perform("ChoicesOutcome"),
}
quiz = Quiz.new(quiz_hash)
quiz.print_instructions
responses = quiz.run_quiz
#print_responses(responses)
results = quiz.calculate_result(responses)

max = results.max_by{|k,v| v}
outcome = quiz.outcomes.find { |o| o.label == max[0]}

puts "=====Your result is:====="
puts results
puts outcome.label
puts outcome.description
puts max[1]



