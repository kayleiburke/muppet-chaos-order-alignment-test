class ChoicesOutcome
  extend ActiveRecordLite::ClassMethods

  attr_accessor :id, :choice_id, :outcome_id, :value

  def initialize(id:, choice_id:, outcome_id:, value:)
    @id = id
    @choice_id = choice_id
    @outcome_id = outcome_id
    @value = value
  end
end