class Answer < ApplicationRecord
  belongs_to :room
  belongs_to :question
  belongs_to :alternative
  belongs_to :user

  def correct?
    question.correct_alternative == self.alternative
  end
end
