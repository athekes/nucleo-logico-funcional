class Alternative < ApplicationRecord
  belongs_to :question

  enum position: { first_alternative: 0, second_alternative: 1, third_alternative: 2, fourth_alternative: 3}
end
