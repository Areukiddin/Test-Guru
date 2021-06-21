module ResultsHelper
  def questions_counter(test_passage)
    "Question #{test_passage.test.questions.find_index(test_passage.current_question) + 1}/#{test_passage.test.questions.count}"
  end

  def correct_answers_percent(test_passage)
    "#{(test_passage.correct_answers.to_f / test_passage.test.questions.each { |q| q.answers.correct }.count * 100).to_i}%"
  end

  def success_result?(test_passage)
    correct_answers_percent(test_passage).to_i >= 85
  end
end
