class Question
  extend ActiveRecordLite::ClassMethods

  attr_accessor :id
  attr_accessor :label
  attr_accessor :choices

  def initialize(id:, label:, choices: [])
    @id = id
    @label = label
    @choices = Choice.where(question_id: id)
  end
end
