module QuestionsHelper
  def question_form_header(question)
    if question.persisted?
      "Edit #{question.test.title} question"
    else
      "Create New #{question.test.title} question"
    end
  end
end
