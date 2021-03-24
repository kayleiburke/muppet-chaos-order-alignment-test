class Outcome < Base

  attr_accessor :description, :label
  attr_int :id, :quiz_id

  def initialize(id:, label:, description:"", quiz_id:)
    @id = id
    @label = label
    @quiz_id = quiz_id
    @description = description
  end
end