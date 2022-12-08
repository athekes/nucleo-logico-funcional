# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

questionaire = Questionaire.create!(title: "Questionaire1")

question = Question.create!(body: "Question1", questionaire: questionaire)

Alternative.create!(body: "alternative1", correct: true, position: 0, question: question)
Alternative.create!(body: "alternative2", correct: false, position: 1, question: question)
Alternative.create!(body: "alternative3", correct: false, position: 2, question: question)
Alternative.create!(body: "alternative4", correct: false, position: 3, question: question)

question2 = Question.create!(body: "Question2", questionaire: questionaire, previous_question_id: question.id)

Alternative.create!(body: "alternative1", correct: false, position: 0, question: question2)
Alternative.create!(body: "alternative2", correct: true, position: 1, question: question2)
Alternative.create!(body: "alternative3", correct: false, position: 2, question: question2)
Alternative.create!(body: "alternative4", correct: false, position: 3, question: question2)
