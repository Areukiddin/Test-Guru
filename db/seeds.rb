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

tests = [{ title: 'HTML', category_id: Category.first.id, author_id: User.first.id },
         { title: 'Ruby', category_id: Category.last.id, author_id: User.first.id },
         { title: 'CSS', category_id: Category.first.id, author_id: User.first.id }]

tests.each { |t| Test.create! t }

questions = [{ body: 'Какой из предложенных тегов соответствует параграфу?', test_id: Test.find_by(title: 'HTML').id },
             { body: 'Как называется функция, которая автоматически создаёт только в классе метод присвоения переменной?',
               test_id: Test.find_by(title: 'Ruby').id },
             { body: 'Как расшифровывается CSS', test_id: Test.find_by(title: 'CSS').id }]

questions.each { |q| Question.create! q }

answers = [{ body: '<div>', correct: false, question_id: Question.first.id },
           { body: '<span>', correct: false, question_id: Question.first.id },
           { body: '<p>', correct: true, question_id: Question.first.id },
           { body: '<a>', correct: false, question_id: Question.first.id },
           { body: 'attr_reader', correct: false, question_id: Question.find_by(test_id: Test.find_by(title: 'Ruby').id).id },
           { body: 'attr_accessor', correct: false, question_id: Question.find_by(test_id: Test.find_by(title: 'Ruby').id).id },
           { body: 'initialize', correct: false, question_id: Question.find_by(test_id: Test.find_by(title: 'Ruby').id).id },
           { body: 'attr_writer', correct: true, question_id: Question.find_by(test_id: Test.find_by(title: 'Ruby').id).id },
           { body: 'Common Style Sheets', correct: false, question_id: Question.last.id },
           { body: 'Computer Style Sheets', correct: false, question_id: Question.last.id },
           { body: 'Cascading Style Sheets', correct: true, question_id: Question.last.id }]

answers.each { |a| Answer.create! a }

results = [{ user_id: User.first.id, test_id: Test.find_by(title: 'HTML').id },
           { user_id: User.first.id, test_id: Test.find_by(title: 'Ruby').id },
           { user_id: User.first.id, test_id: Test.find_by(title: 'CSS').id }]

results.each { |r| Result.create! r }
