class Question < ApplicationRecord
  belongs_to :questionaire

  belongs_to :previous_question, class_name: 'Question', foreign_key: 'previous_question_id', optional: true
  has_one :next_question, inverse_of: :previous_question, class_name: 'Question', foreign_key: 'previous_question_id'
end
