class RoomsChannel < ApplicationCable::Channel
  def subscribed
    room = Room.find(params[:id])
    user = User.find(params[:user_id])

    stream_for room

    room.connect(user)

    RoomsChannel.broadcast_to(room, "Conectado na sala: #{room.state}")
  end

  def init_game(data)
    room = Room.find(params[:id])

    room.update(state: :asking_questions, current_question: room.questions.first)
    state = {
      room: room.code,
      state: room.state
    }.to_json
    RoomsChannel.broadcast_to(room, state)

    #dando broadcast na perguntas e nas alternativas
    question = {
      question: room.current_question,
      alternatives: room.current_question.alternatives
    }.to_json
    RoomsChannel.broadcast_to(room, question)
  end

  def show_current_scoreboard(data)
    room = Room.find(params[:id])

    scoreboard = room.last_scoreboard.to_json
    RoomsChannel.broadcast_to(room, scoreboard)
  end

  def register_answer(data)
    room = Room.find(params[:id])
    user = User.find(params[:user_id])
    alternative = Alternative.find(data['alternative_id']) 

    return unless room.asking_questions?

    # registra uma pergunta e retorna para o user
    user.answers.create(room: room, question: room.current_question, alternative: alternative)
    RoomsChannel.broadcast_to(room, { message: 'Aswer registred' }.to_json)

    # go_to_next_question(room)
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
    # room.disconnect(user)
  end

  private 

  def all_have_answered?
    answers = []
    room.connected_users.each do |user|
      answers << true if user_answered?(user, rom.current_question)
    end

    room.connected_users.count == answers.count
  end

  def connected_users
    ActionCable.server.connections.select { |con| con.current_room == room }
  end

  def go_to_next_question(room)
    if room.next_question
      room.update(current_question: room.current_question.next_question)

      #dando broadcast na perguntas e nas alternativas
      question = {
        question: room.current_question,
        alternatives: room.current_question.alternatives
      }.to_json
      RoomsChannel.broadcast_to(room, question)
    else
      # quando o chegar no final atualiza o status e mostra o score board
      room.update(state: :ending, current_question: nil)
      state = {
        room: room.code,
        state: room.state
      }.to_json
      RoomsChannel.broadcast_to(room, state)
    end
  end
end
