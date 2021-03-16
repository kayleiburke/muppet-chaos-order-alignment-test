class Question
  attr_accessor :id
  attr_accessor :label

  def initialize(id, label)
    @id = id
    @label = label
  end
end