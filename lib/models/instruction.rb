class Instruction < Base

  attr_accessor :instruction
  attr_int :id, :quiz_id

  def initialize(id:, quiz_id:, instruction:)
    @id = id
    @quiz_id = quiz_id
    @instruction = instruction
  end
end
