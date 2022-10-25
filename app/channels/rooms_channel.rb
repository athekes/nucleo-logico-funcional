class RoomsChannel < ApplicationCable::Channel
  def subscribed
    room = Room.find(params[:id])
    stream_for room

    RoomsChannel.broadcast_to(room, "Conectado na sala: #{room.state}")

    #1 esperando inicio

    #2 Ler pergunta e esperando resposta

    #3 mostrando parcial

    #4 mostrando final
  end


  def init_game(data)
    room = Room.find(params[:id])

    room.update(state: :asking_questions, current_question: room.questions.first)
    state = {
      room: room.code,
      state: room.state
    }.to_json
    RoomsChannel.broadcast_to(room, state)

    room.questionaire.questions.each do |question|
      #dando broadcast na perguntas e nas alternativas
      question = {
        question: question.body,
        alternatives: 'alternatives'
      }.to_json
      RoomsChannel.broadcast_to(room, question)

      # esperando o tempo para as respostas
      sleep(10.seconds)

      # mostrando o placar parcial
      scoreboard = room.last_scoreboard.to_json
      RoomsChannel.broadcast_to(room, scoreboard)

      room.update(state: :asking_questions, current_question: room.current_question.next_question) if room.current_question.next_question.present?
    end

    # quando o chegar no final atualiza o status e mostra o score board
    room.update(state: :ending, current_question: nil)
    state = {
      room: room.code,
      state: room.state
    }.to_json
    RoomsChannel.broadcast_to(room, state)

    scoreboard = room.last_scoreboard.to_json
    RoomsChannel.broadcast_to(room, question)
  end

  def register_answer(data)
    room = Room.find(params[:id])
    user = user.find(data["user_id"])

    return if not room.asking_questions?

    # registra uma pergunta e retorna para o user
    room.current_question.answers.create(user: user, answer: data['aswer'])
    RoomsChannel.broadcast_to(user, { message: 'Aswer registred' }.to_json)
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
