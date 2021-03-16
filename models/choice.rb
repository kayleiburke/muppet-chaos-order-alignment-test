class Choice
  attr_accessor :id, :label, :question_id, :order

  def initialize(id:, label:, question_id:, order:)
    @id = id
    @label = label
    @question_id = question_id
    @order = order
  end
end