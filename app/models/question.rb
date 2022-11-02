class Question < ApplicationRecord
  belongs_to :questionaire

  belongs_to :previous_question, class_name: 'Question', foreign_key: 'previous_question_id', optional: true
  has_one :next_question, inverse_of: :previous_question, class_name: 'Question', foreign_key: 'previous_question_id'

  has_many :alternatives

  def first_alternative
    alternatives.first_alternative
  end

  def second_alternative
    alternatives.second_alternative
  end

  def third_alternative
    alternatives.third_alternative
  end

  def fourth_alternative
    alternatives.fourth_alternative
  end

  def correct_alternative
    alternatives.where(correct: true).first
  end

end
