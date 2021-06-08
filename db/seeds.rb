# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!({ name: 'Evgeny', email: 'test@test.com', password: '123456' })

categories = [{ title: 'Frontend' }, { title: 'Backend' }]

categories.each { |c| Category.create! c }

tests = [{ title: 'HTML', category: Category.first, author: User.first },
         { title: 'Ruby', category: Category.last, author: User.first },
         { title: 'CSS', category: Category.first, author: User.first }]

tests.each { |t| Test.create! t }

questions = [{ body: 'Какой из предложенных тегов соответствует параграфу?', test: Test.find_by(title: 'HTML') },
             { body: 'Как называется функция, которая автоматически создаёт только в классе метод присвоения переменной?',
               test: Test.find_by(title: 'Ruby') },
             { body: 'Как расшифровывается CSS', test: Test.find_by(title: 'CSS') }]

questions.each { |q| Question.create! q }

answers = [{ body: '<div>', correct: false, question: Question.first },
           { body: '<span>', correct: false, question: Question.first },
           { body: '<p>', correct: true, question: Question.first },
           { body: '<a>', correct: false, question: Question.first },
           { body: 'attr_reader', correct: false, question: Question.find_by(test: Test.find_by(title: 'Ruby')) },
           { body: 'attr_accessor', correct: false, question: Question.find_by(test: Test.find_by(title: 'Ruby')) },
           { body: 'initialize', correct: false, question: Question.find_by(test: Test.find_by(title: 'Ruby')) },
           { body: 'attr_writer', correct: true, question: Question.find_by(test: Test.find_by(title: 'Ruby')) },
           { body: 'Common Style Sheets', correct: false, question: Question.last },
           { body: 'Computer Style Sheets', correct: false, question: Question.last },
           { body: 'Cascading Style Sheets', correct: true, question: Question.last }]

answers.each { |a| Answer.create! a }

results = [{ user: User.first, test: Test.find_by(title: 'HTML') },
           { user: User.first, test: Test.find_by(title: 'Ruby') },
           { user: User.first, test: Test.find_by(title: 'CSS') }]

results.each { |r| Result.create! r }
