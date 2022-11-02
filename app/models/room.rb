class Room < ApplicationRecord
  enum state: { waiting: 0, asking_questions: 1, ending: 2 }
  belongs_to :questionaire
  belongs_to :current_question, class_name: 'Question', foreign_key: 'current_question_id', optional: true 

  def last_scoreboard
    p 'Placar'
  end

  def questions
    questionaire.questions
  end

  def next_question
    current_question.next_question
  end

  def last_scoreboard
  end
end