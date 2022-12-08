class Question < ApplicationRecord
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
