class Quiz
  extend ActiveRecordLite::ClassMethods

  attr_accessor :name, :description, :instructions, :questions, :choices, :outcomes, :choices_outcomes, :id

  def initialize(id:, description:, instructions:, questions:, choices: [], outcomes:, choices_outcomes:)
    @id = id
    @description = description
    @instructions = instructions
    @questions = questions
    @choices = choices
    @outcomes = outcomes
    @choices_outcomes = choices_outcomes
  end

  def print_instructions
    instructions.each do |instruction|
      puts instruction
    end
  end

  def run_quiz
    responses = []
    questions.each do |question|
      question_choices = question.choices # choices.select { |choice| choice.question_id == question.id }.sort_by { |choice| choice.order }
      puts "* #{question.label} *"

      question_choices.each do |choice|
        puts "#{choice.order}. #{choice.label}"
      end

      answer = gets.chomp.to_i

      while !answer.between?(1, question_choices.size) do
        puts "That is an invalid input. Please provide a response between 1 and #{question_choices.size}."
        answer = gets.chomp.to_i
      end

      responses.push(question_choices.find { |choice| choice.order.to_i == answer })
    end
    responses
  end

  def calculate_result(responses)
    outcome_scores = Hash.new(0)

    responses.each do |response|
      outcomes.each do |outcome|
        outcome_scores[outcome.label] = outcome_scores[outcome.label] + choices_outcomes.find { |co| co.choice_id == response.id && co.outcome_id == outcome.id }.value.to_i
      end
    end

    outcome_scores
  end
end