module TestsHelper
  def test_form_header(test)
    if test.persisted?
      "Edit #{test.title}"
    else
      'Create New test'
    end
  end

  def convert_test_level(level)
    case level
    when 0..1 then 'Easy'
    when 2..4 then 'Medium'
    else
      'Hard'
    end
  end
end
