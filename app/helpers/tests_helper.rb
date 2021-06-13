module TestsHelper
  def test_form_header(test)
    if test.persisted?
      "Edit #{test.title}"
    else
      'Create New test'
    end
  end
end
