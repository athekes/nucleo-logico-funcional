class Room < ApplicationRecord
  enum state: { waiting: 0, asking_questions: 1, ending: 2 }
  belongs_to :questionaire
  belongs_to :current_question, class_name: 'Question', foreign_key: 'current_question_id', optional: true 

  has_many :connected_users, class_name: 'User', inverse_of: :connected_room, foreign_key: 'room_id'

  def connect(user)
    user.connect_to(self)
  end

  def disconnect(user)
    user.disconnect
  end

  def questions
    questionaire.questions
  end

  def next_question
    current_question.next_question
  end

  def last_scoreboard
    scoreboard = {}

    connected_users.each do |user|
      scoreboard[user.name] = user.answers.where(room: self).select {|answer| answer.correct? }.count
    end

    scoreboard
  end
end
