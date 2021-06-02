class User < ApplicationRecord
  def results_list_by(level)
    Test.joins('LEFT JOIN results ON tests.id = results.test_id')
        .where(results: { user_id: id }, level: level)
  end
end
