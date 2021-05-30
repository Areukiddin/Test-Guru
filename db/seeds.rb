# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
categories = [{ id: 1, title: 'Frontend' }, { id: 2, title: 'Backend' }]

tests = [{ id: 1, title: 'HTML', category_id: 1, author_id: 1 }, { id: 2, title: 'Ruby', category_id: 2, author_id: 1 },
         { id: 3, title: 'CSS', category_id: 1, author_id: 1 }]

questions = [{ id: 1, body: 'Какой из предложенных тегов соответствует параграфу?', test_id: 1 },
             { id: 2, body: 'Как называется функция, которая автоматически создаёт только в классе метод присвоения переменной?',
               test_id: 2 },
             { id: 3, body: 'Как расшифровывается CSS', test_id: 3 }]

answers = [{ body: '<div>', correct: false, question_id: 1 },
           { body: '<span>', correct: false, question_id: 1 },
           { body: '<p>', correct: true, question_id: 1 },
           { body: '<a>', correct: false, question_id: 1 },
           { body: 'attr_reader', correct: false, question_id: 2 },
           { body: 'attr_accessor', correct: false, question_id: 2 },
           { body: 'initialize', correct: false, question_id: 2 },
           { body: 'attr_writer', correct: true, question_id: 2 },
           { body: 'Common Style Sheets', correct: false, question_id: 3 },
           { body: 'Computer Style Sheets', correct: false, question_id: 3 },
           { body: 'Cascading Style Sheets', correct: true, question_id: 3 }]

results = [{ user_id: 1, test_id: 1 }, { user_id: 1, test_id: 2 }, { user_id: 1, test_id: 3 }]

User.find_or_create_by!({ id: 1, name: 'Evgeny', email: 'test@test.com', password: '123456' })
categories.each { |c| Category.find_or_create_by! c }
tests.each { |t| Test.find_or_create_by! t }
questions.each { |q| Question.find_or_create_by! q }
answers.each { |a| Answer.find_or_create_by! a }
results.each { |r| Result.find_or_create_by! r }
