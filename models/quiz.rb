class Quiz
  attr_accessor :name, :description, :instructions, :questions, :choices, :outcomes, :choices_outcomes

  def initialize(id:, description:, instructions:, questions:, choices:, outcomes:, choices_outcomes:)
    @id = id
    @description = description
    @instructions = instructions
    @questions = questions
    @choices = choices
    @outcomes = outcomes
    @choices_outcomes = choices_outcomes
  end
end