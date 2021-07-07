User.create!({ first_name: 'Evgeny', last_name: 'Maximov', email: 'test@test.com', password: '123456', type: 'Admin' })

categories = [{ title: 'Frontend' }, { title: 'Backend' }]

categories.each { |c| Category.create! c }

tests = [{ title: 'HTML', category: Category.find_by(title: 'Frontend'), author: User.first },
         { title: 'Ruby', category: Category.find_by(title: 'Backend'), author: User.first },
         { title: 'CSS', category: Category.find_by(title: 'Frontend'), author: User.first }]

tests.each { |t| Test.create! t }

questions = [{ body: 'Which HTML tag is match paragraph?', test: Test.find_by(title: 'HTML') },
             { body: 'What function automatically creates appropriation variable method?',
               test: Test.find_by(title: 'Ruby') },
             { body: 'Css is: ', test: Test.find_by(title: 'CSS') }]

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
