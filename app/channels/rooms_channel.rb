class RoomsChannel < ApplicationCable::Channel
  def subscribed
    room = Room.find(params[:id])
    user = User.find(params[:user_id])

    stream_for room

    current_game.enter_room(user: user)
  end

  def init_game(data)
    current_game.init_game
  end

  def show_current_scoreboard(data)
    current_game.show_current_scoreboard
  end

  def register_answer(data)
    user = User.find(params[:user_id])
    alternative = Alternative.find(data['alternative_id']) 

    current_game.register_answer(user: user, alternative: alternative)
  end

  def unsubscribed
    user = connection.connected_user

    current_game.desconnect_from_room(user: user)
  end

  private

  def current_game
    room = Room.find(params[:id])
    Game::Quizz.new(room: room)
  end
end
