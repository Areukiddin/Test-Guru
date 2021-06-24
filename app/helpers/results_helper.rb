module ResultsHelper
  def questions_counter(test_passage)
    "Question #{test_passage.test.questions.find_index(test_passage.current_question) + 1}/#{test_passage.test.questions.count}"
  end
end
