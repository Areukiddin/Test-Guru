module TestsHelper
  def test_form_header(test)
    if test.persisted?
      "Edit #{test.title}"
    else
      'Create New test'
    end
  end

  def convert(level)
    case level
    when 0..1
      'Easy'
    when 2..4
      'Medium'
    else
      'Hard'
    end
  end
end
