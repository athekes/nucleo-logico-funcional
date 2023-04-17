desc "Creates all questions on api."

task create_questions: :environment do

  puts '################## Criando Questões ##################'

  question = Question.create!(body: "Qual é o elemento químico mais abundante no universo?")
  Alternative.create!(body: "Hidrogênio", correct: true, position: 0, question: question)
  Alternative.create!(body: "Oxigênio", correct: false, position: 1, question: question)
  Alternative.create!(body: "Carbono", correct: false, position: 2, question: question)
  Alternative.create!(body: "Ferro", correct: false, position: 3, question: question)

  question = Question.create!(body: "Qual é a capital do Brasil?")
  Alternative.create!(body: "Rio de Janeiro", correct: false, position: 0, question: question)
  Alternative.create!(body: "Brasília", correct: true, position: 1, question: question)
  Alternative.create!(body: "São Paulo", correct: false, position: 2, question: question)
  Alternative.create!(body: "Belo Horizonte", correct: false, position: 3, question: question)

  question = Question.create!(body: "Quem pintou a famosa obra 'A Última Ceia'?")
  Alternative.create!(body: "Michelangelo", correct: false, position: 0, question: question)
  Alternative.create!(body: "Leonardo da Vinci", correct: true, position: 1, question: question)
  Alternative.create!(body: "Pablo Picasso", correct: false, position: 2, question: question)
  Alternative.create!(body: "Vincent van Gogh", correct: false, position: 3, question: question)

  question = Question.create!(body: "Qual é o nome do maior deserto do mundo?")
  Alternative.create!(body: "Deserto do Saara", correct: false, position: 0, question: question)
  Alternative.create!(body: "Deserto de Gobi", correct: false, position: 1, question: question)
  Alternative.create!(body: "Deserto do Atacama", correct: false, position: 2, question: question)
  Alternative.create!(body: "Antártida", correct: true, position: 3, question: question)

  question = Question.create!(body: "Qual é o nome da cordilheira de montanhas que atravessa a América do Sul?")
  Alternative.create!(body: "Montanhas Rochosas", correct: false, position: 0, question: question)
  Alternative.create!(body: "Montanhas dos Andes", correct: true, position: 1, question: question)
  Alternative.create!(body: "Cordilheira do Himalaia", correct: false, position: 2, question: question)
  Alternative.create!(body: "Montanhas dos Apalaches", correct: false, position: 3, question: question)

  question = Question.create!(body: "Quem escreveu 'Dom Quixote'?")
  Alternative.create!(body: "Miguel de Cervantes", correct: true, position: 0, question: question)
  Alternative.create!(body: "William Shakespeare", correct: false, position: 1, question: question)
  Alternative.create!(body: "Jorge Luis Borges", correct: false, position: 2, question: question)
  Alternative.create!(body: "Gabriel García Márquez", correct: false, position: 3, question: question)

  question = Question.create!(body: "Qual é o nome da maior floresta tropical do mundo?")
  Alternative.create!(body: "Floresta Amazônica", correct: true, position: 0, question: question)
  Alternative.create!(body: "Floresta do Congo", correct: false, position: 1, question: question)
  Alternative.create!(body: "Floresta Boreal", correct: false, position: 2, question: question)
  Alternative.create!(body: "Floresta de Bornéu", correct: false, position: 3, question: question)

  question = Question.create!(body: "Qual é o nome da pessoa que fundou a Microsoft?")
  Alternative.create!(body: "Steve Jobs", correct: false, position: 0, question: question)
  Alternative.create!(body: "Bill Gates", correct: true, position: 1, question: question)
  Alternative.create!(body: "Mark Zuckerberg", correct: false, position: 2, question: question)
  Alternative.create!(body: "Larry Page", correct: false, position: 3, question: question)

  question = Question.create!(body: "Qual é a capital da Austrália?")
  Alternative.create!(body: "Sydney", correct: false, position: 0, question: question)
  Alternative.create!(body: "Melbourne", correct: false, position: 1, question: question)
  Alternative.create!(body: "Canberra", correct: true, position: 2, question: question)
  Alternative.create!(body: "Brisbane", correct: false, position: 3, question: question)

  question = Question.create!(body: "Em que ano a primeira Guerra Mundial terminou?")
  Alternative.create!(body: "1914", correct: false, position: 0, question: question)
  Alternative.create!(body: "1915", correct: false, position: 1, question: question)
  Alternative.create!(body: "1918", correct: true, position: 2, question: question)
  Alternative.create!(body: "1922", correct: false, position: 3, question: question)

  question = Question.create!(body: "Qual é o rio mais longo do mundo?")
  Alternative.create!(body: "Rio Amazonas", correct: true, position: 0, question: question)
  Alternative.create!(body: "Rio Nilo", correct: false, position: 1, question: question)
  Alternative.create!(body: "Rio Mississipi", correct: false, position: 2, question: question)
  Alternative.create!(body: "Rio Yangtze", correct: false, position: 3, question: question)

  question = Question.create!(body: "Quem foi o primeiro presidente do Brasil?")
  Alternative.create!(body: "Getúlio Vargas", correct: false, position: 0, question: question)
  Alternative.create!(body: "Juscelino Kubitschek", correct: false, position: 1, question: question)
  Alternative.create!(body: "Deodoro da Fonseca", correct: true, position: 2, question: question)
  Alternative.create!(body: "Tancredo Neves", correct: false, position: 3, question: question)

  question = Question.create!(body: "Quem pintou a Mona Lisa?")
  Alternative.create!(body: "Pablo Picasso", correct: false, position: 0, question: question)
  Alternative.create!(body: "Leonardo da Vinci", correct: true, position: 1, question: question)
  Alternative.create!(body: "Vincent van Gogh", correct: false, position: 2, question: question)
  Alternative.create!(body: "Michelangelo", correct: false, position: 3, question: question)

  question = Question.create!(body: "Em que país fica a Torre Eiffel?")
  Alternative.create!(body: "Espanha", correct: false, position: 0, question: question)
  Alternative.create!(body: "Itália", correct: false, position: 1, question: question)
  Alternative.create!(body: "França", correct: true, position: 2, question: question)
  Alternative.create!(body: "Alemanha", correct: false, position: 3, question: question)

  question = Question.create!(body: "Qual é a fórmula química da água?")
  Alternative.create!(body: "H3O", correct: false, position: 0, question: question)
  Alternative.create!(body: "H2O2", correct: false, position: 1, question: question)
  Alternative.create!(body: "H2O", correct: true, position: 2, question: question)
  Alternative.create!(body: "HO", correct: false, position: 3, question: question)

  question = Question.create!(body: "Qual é a capital da França?")
  Alternative.create!(body: "Madri", correct: false, position: 0, question: question)
  Alternative.create!(body: "Paris", correct: true, position: 1, question: question)
  Alternative.create!(body: "Londres", correct: false, position: 2, question: question)
  Alternative.create!(body: "Roma", correct: false, position: 3, question: question)

  question = Question.create!(body: "Qual é o instrumento musical mais popular do mundo?")
  Alternative.create!(body: "Violão", correct: true, position: 0, question: question)
  Alternative.create!(body: "Piano", correct: false, position: 1, question: question)
  Alternative.create!(body: "Bateria", correct: false, position: 2, question: question)
  Alternative.create!(body: "Guitarra", correct: false, position: 3, question: question)

  question = Question.create!(body: "Qual é o maior planeta do sistema solar?")
  Alternative.create!(body: "Vênus", correct: false, position: 0, question: question)
  Alternative.create!(body: "Júpiter", correct: true, position: 1, question: question)
  Alternative.create!(body: "Marte", correct: false, position: 2, question: question)
  Alternative.create!(body: "Netuno", correct: false, position: 3, question: question)

  question = Question.create!(body: "Quem escreveu 'O Pequeno Príncipe'?")
  Alternative.create!(body: "Hans Christian Andersen", correct: false, position: 0, question: question)
  Alternative.create!(body: "J.K. Rowling", correct: false, position: 1, question: question)
  Alternative.create!(body: "Antoine de Saint-Exupéry", correct: true, position: 2, question: question)
  Alternative.create!(body: "Miguel de Cervantes", correct: false, position: 3, question: question)

  question = Question.create!(body: "Qual o nome da fada-madrinha de Cinderela?")
  Alternative.create!(body: "Morgana", correct: false, position: 0, question: question)
  Alternative.create!(body: "Elsa", correct: false, position: 1, question: question)
  Alternative.create!(body: "Fada Azul", correct: false, position: 2, question: question)
  Alternative.create!(body: "Fada Madrinha", correct: true, position: 3, question: question)

  question = Question.create!(body: "Qual é a capital do Canadá?")
  Alternative.create!(body: "Toronto", correct: false, position: 0, question: question)
  Alternative.create!(body: "Ottawa", correct: true, position: 1, question: question)
  Alternative.create!(body: "Montreal", correct: false, position: 2, question: question)


  question = Question.create!(body: "Qual desses elementos químicos é líquido em temperatura ambiente?")
  Alternative.create!(body: "Bromo", correct: true, position: 0, question: question)
  Alternative.create!(body: "Cloro", correct: false, position: 1, question: question)
  Alternative.create!(body: "Flúor", correct: false, position: 2, question: question)
  Alternative.create!(body: "Iodo", correct: false, position: 3, question: question)


  question = Question.create!(body: "Qual é o maior animal terrestre?")
  Alternative.create!(body: "Elefante", correct: true, position: 0, question: question)
  Alternative.create!(body: "Rinoceronte", correct: false, position: 1, question: question)
  Alternative.create!(body: "Hipopótamo", correct: false, position: 2, question: question)
  Alternative.create!(body: "Girafa", correct: false, position: 3, question: question)

  question = Question.create!(body: "Qual é o estado brasileiro que possui o maior número de municípios?")
  Alternative.create!(body: "São Paulo", correct: false, position: 0, question: question)
  Alternative.create!(body: "Minas Gerais", correct: false, position: 1, question: question)
  Alternative.create!(body: "Rio Grande do Sul", correct: false, position: 2, question: question)
  Alternative.create!(body: "Pará", correct: true, position: 3, question: question)

  question = Question.create!(body: "Qual o nome do maior deserto do mundo?")
  Alternative.create!(body: "Atacama", correct: false, position: 0, question: question)
  Alternative.create!(body: "Sahara", correct: true, position: 1, question: question)
  Alternative.create!(body: "Gobi", correct: false, position: 2, question: question)
  Alternative.create!(body: "Arábico", correct: false, position: 3, question: question)

  question = Question.create!(body: "Qual é o rio mais extenso do mundo?")
  Alternative.create!(body: "Amazonas", correct: true, position: 0, question: question)
  Alternative.create!(body: "Nilo", correct: false, position: 1, question: question)
  Alternative.create!(body: "Mississippi", correct: false, position: 2, question: question)
  Alternative.create!(body: "Yangtzé", correct: false, position: 3, question: question)

  question = Question.create!(body: "Qual é o nome do menor país do mundo em área territorial?")
  Alternative.create!(body: "Vaticano", correct: true, position: 0, question: question)
  Alternative.create!(body: "Mônaco", correct: false, position: 1, question: question)
  Alternative.create!(body: "Nauru", correct: false, position: 2, question: question)
  Alternative.create!(body: "Malta", correct: false, position: 3, question: question)

  question = Question.create!(body: "Qual é a capital do Chile?")
  Alternative.create!(body: "Lima", correct: false, position: 0, question: question)
  Alternative.create!(body: "Buenos Aires", correct: false, position: 1, question: question)
  Alternative.create!(body: "Santiago", correct: true, position: 2, question: question)
  Alternative.create!(body: "Montevidéu", correct: false, position: 3, question: question)

  question = Question.create!(body: "Qual é o único continente que não tem tigres selvagens?")
  Alternative.create!(body: "Europa", correct: true, position: 0, question: question)
  Alternative.create!(body: "América", correct: false, position: 1, question: question)
  Alternative.create!(body: "África", correct: false, position: 2, question: question)
  Alternative.create!(body: "Antártica", correct: false, position: 3, question: question)

  question = Question.create!(body: "Qual é o animal mais rápido do mundo?")
  Alternative.create!(body: "Guepardo", correct: true, position: 0, question: question)
  Alternative.create!(body: "Antílope", correct: false, position: 1, question: question)
  Alternative.create!(body: "Leopardo", correct: false, position: 2, question: question)
  Alternative.create!(body: "Jaguar", correct: false, position: 3, question: question)

  question = Question.create!(body: "Quem é o criador do Facebook?")
  Alternative.create!(body: "Jeff Bezos", correct: false, position: 0, question: question)
  Alternative.create!(body: "Bill Gates", correct: false, position: 1, question: question)
  Alternative.create!(body: "Mark Zuckerberg", correct: true, position: 2, question: question)
  Alternative.create!(body: "Steve Jobs", correct: false, position: 3, question: question)

  question = Question.create!(body: "Qual é o coletivo de cães?")
  Alternative.create!(body: "Matilha", correct: true, position: 0, question: question)
  Alternative.create!(body: "Cardume", correct: false, position: 1, question: question)
  Alternative.create!(body: "Bando", correct: false, position: 2, question: question)
  Alternative.create!(body: "Manada", correct: false, position: 3, question: question)

  question = Question.create!(body: "Quem é a autora da série de livros Harry Potter?")
  Alternative.create!(body: "J.K. Rowling", correct: true, position: 0, question: question)
  Alternative.create!(body: "Stephenie Meyer", correct: false, position: 1, question: question)
  Alternative.create!(body: "Suzanne Collins", correct: false, position: 2, question: question)
  Alternative.create!(body: "George R.R. Martin", correct: false, position: 3, question: question)

  question = Question.create!(body: "Qual é o nome do planeta vermelho?")
  Alternative.create!(body: "Marte", correct: true, position: 0, question: question)
  Alternative.create!(body: "Júpiter", correct: false, position: 1, question: question)
  Alternative.create!(body: "Saturno", correct: false, position: 2, question: question)
  Alternative.create!(body: "Urano", correct: false, position: 3, question: question)

  question = Question.create!(body: "Qual é o nome da famosa cidade italiana que é conhecida como a cidade dos canais?")
  Alternative.create!(body: "Veneza", correct: true, position: 0, question: question)
  Alternative.create!(body: "Roma", correct: false, position: 1, question: question)
  Alternative.create!(body: "Milão", correct: false, position: 2, question: question)
  Alternative.create!(body: "Florença", correct: false, position: 3, question: question)

  question = Question.create!(body: "Qual é o nome da técnica de pintura em que se usa água para diluir a tinta?")
  Alternative.create!(body: "Aquarela", correct: true, position: 0, question: question)
  Alternative.create!(body: "Óleo sobre tela", correct: false, position: 1, question: question)
  Alternative.create!(body: "Pintura em acrílico", correct: false, position: 2, question: question)
  Alternative.create!(body: "Grafite", correct: false, position: 3, question: question)

  question = Question.create!(body: "Qual foi o primeiro homem a pisar na Lua?")
  Alternative.create!(body: "Neil Armstrong", correct: true, position: 0, question: question)
  Alternative.create!(body: "Buzz Aldrin", correct: false, position: 1, question: question)
  Alternative.create!(body: "Yuri Gagarin", correct: false, position: 2, question: question)
  Alternative.create!(body: "Alan Shepard", correct: false, position: 3, question: question)

  question = Question.create!(body: "Qual é a capital do estado de Minas Gerais?")

  Alternative.create!(body: "Rio de Janeiro", correct: false, position: 0, question: question)
  Alternative.create!(body: "São Paulo", correct: false, position: 1, question: question)
  Alternative.create!(body: "Belo Horizonte", correct: true, position: 2, question: question)
  Alternative.create!(body: "Salvador", correct: false, position: 3, question: question)

  puts '################## Questões criadas com sucesso ##################'
end
