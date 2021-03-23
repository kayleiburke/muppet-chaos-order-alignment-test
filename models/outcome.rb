class Outcome
  extend ActiveRecordLite::ClassMethods

  attr_accessor :id, :label, :description, :quiz_id

  def initialize(id:, label:, description:"", quiz_id:)
    @id = id
    @label = label
    @quiz_id = quiz_id
    @description = description
  end
end