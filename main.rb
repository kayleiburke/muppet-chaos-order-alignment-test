# frozen_string_literal: true
require "pry-byebug"
require "csv"
require "active_support/inflector"

Dir["lib/models/concerns/*.rb", "lib/models/*.rb", "lib/interactors/*.rb"].each {|file| require_relative file }

def print_responses(responses)
  responses.each_with_index do |response, index|
    puts (index + 1).to_s + ". " + response[:question].label
    puts response[:answer].label
  end
end

quizzes = Quiz.all

puts "Please select a quiz:"

quizzes.each do |quiz|
  puts "* #{quiz.id} #{quiz.description}"
end

answer = gets.chomp.to_i

while !answer.between?(1, quizzes.size) do
  puts "That is an invalid input. Please provide a response between 1 and #{quizzes.size}."
  answer = gets.chomp.to_i
end

quiz = Quiz.where(id: answer).first
# Choice.in(question_id: quiz.questions)
# debugger
#
# quiz_hash = {
#     id: answer,
#     description: "My Quiz",
#     instructions: get_instructions,
#     questions: Question.where(quiz_id: 1),
#     outcomes: Outcome.where(quiz_id: 1),
#     choices_outcomes: ChoicesOutcome.all,
# }
# quiz = Quiz.new(quiz_hash)
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



