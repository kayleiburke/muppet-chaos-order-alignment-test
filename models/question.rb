class Question
  extend ActiveRecordLite::ClassMethods

  attr_accessor :id, :label, :choices, :quiz_id, :order

  def initialize(id:, label:, quiz_id:, order:, choices: [])
    @id = id
    @label = label
    @quiz_id = quiz_id
    @order = order
    @choices = Choice.where(question_id: id)
  end
end
