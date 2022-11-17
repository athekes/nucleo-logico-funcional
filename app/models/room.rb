class Room < ApplicationRecord
  enum state: { waiting: 0, asking_questions: 1, ending: 2 }

  belongs_to :owner, class_name: 'User', foreign_key: 'owner_id'
  belongs_to :questionaire
  belongs_to :current_question, class_name: 'Question', foreign_key: 'current_question_id', optional: true 

  has_many :connected_users, class_name: 'User', inverse_of: :connected_room, foreign_key: 'room_id'

  validates :code, presence: true
  validates :code, uniqueness: true

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

  def all_answers
    Answer.where(room: self, user: connected_users)
  end

  def current_question_answers
    all_answers.where(question: current_question)
  end

  def current_question_all_answered?
    connected_users.each do |user|
      user_answers_count = current_question_answers.where(user: user).count

      return false if user_answers_count < 1
    end

    return true
  end
end
