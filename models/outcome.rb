class Outcome
  attr_accessor :id
  attr_accessor :label
  attr_accessor :description

  def initialize(id:, label:, description:"")
    @id = id
    @label = label
    @description = description
  end
end