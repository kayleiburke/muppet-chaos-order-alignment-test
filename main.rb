# frozen_string_literal: true
require "pry-byebug"
require "csv"
require "active_support/inflector"

Dir["models/*.rb", "interactors/*.rb"].each {|file| require_relative file }

def get_instructions
  [
      "Find the workout that's best for you!",
      "Please enter the number corresponding to the response that best applies to each statement."
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
results = quiz.calculate_result(responses)

max = results.max_by{|k,v| v}
outcome = quiz.outcomes.find { |o| o.label == max[0]}

puts "=====Your result is:====="
puts results
puts outcome.label
puts outcome.description
puts max[1]



