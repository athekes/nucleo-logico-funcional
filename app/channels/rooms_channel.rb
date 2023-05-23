class RoomsChannel < ApplicationCable::Channel
  def subscribed
    room = Room.find(params[:room_id])

    if room.waiting?
      stream_for room
      current_game.enter_room(user: connection.connected_user)
    else
      connection.transmit identifier: params.to_json, error: "Room is not acceptin new users", code: 'unpermitted'
      reject
    end
  end

  def init_game(data)
    current_game.init_game(user: connection.connected_user)
  end

  def show_current_scoreboard(data)
    current_game.show_current_scoreboard
  end

  def register_answer(data)
    alternative_position_mapping = {
      a: 'first_alternative',
      A: 'first_alternative',
      b: 'second_alternative',
      B: 'second_alternative',
      c: 'third_alternative',
      C: 'third_alternative',
      d: 'fourth_alternative',
      D: 'fourth_alternative'
    }.stringify_keys

    selected_alternative_position =
      if alternative_position_mapping.values.include?(data['alternative_position'])
        data['alternative_position']
      else
        alternative_position_mapping.fetch(data['alternative_position'])
      end

    current_game.register_answer(user: connection.connected_user, alternative_position: selected_alternative_position)
    current_game.try_next_question
  end

  def unsubscribed
    user = connection.connected_user
    connected_room = user.connected_room

    if connected_room.present? # when a user is reject by room there is no room associated
      current_game.disconnect_from_room(user: user)

      if connected_room.connected_users.blank?
        connected_room.destroy
      else
        current_game.try_next_question
      end
    end
  end

  private

  def current_game
    room = Room.find(params[:room_id])
    Game::Quizz.new(room: room)
  end
end
