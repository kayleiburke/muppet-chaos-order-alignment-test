class Quiz < Base

  attr_accessor :name, :description, :id

  def initialize(id:, name:, description:)
    @id = id
    @description = description
    @name = name
  end

  def instructions
    Instruction.where(quiz_id: id)
  end

  def questions
    Question.where(quiz_id: id)
  end

  def outcomes
    Outcome.where(quiz_id: id)
  end

  def choices
    Choice.in(question_id: questions.map(&:id))
  end

  def choices_outcomes
    ChoicesOutcome.in(choice_id: choices.map(&:id))
  end

  def print_instructions
    instructions.each do |instruction|
      puts instruction.instruction
    end
  end

  def run_quiz
    responses = []
    questions.each do |question|
      question_choices = question.choices
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

  # doesn't have to be run in a place that doesn't have a puts
  # interactor by itself
  # run quiz is its own interactor that knows how to take the quiz and output to the screen
  #
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