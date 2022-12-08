class Room < ApplicationRecord
  enum state: { waiting: 0, asking_questions: 1, ending: 2 }

  belongs_to :owner, class_name: 'User', foreign_key: :owner_id
  belongs_to :current_question, class_name: 'Question', foreign_key: :current_question_id, optional: true

  has_and_belongs_to_many :questions

  has_many :connected_users, class_name: 'User', foreign_key: :room_id, dependent: :nullify

  validates :code, presence: true, uniqueness: true

  def next_question
    current_index = questions.find_index(current_question)

    return nil unless current_index

    questions[current_index + 1]
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
