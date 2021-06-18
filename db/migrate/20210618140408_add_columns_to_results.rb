class AddColumnsToResults < ActiveRecord::Migration[6.1]
  def change
    add_reference :results, :current_question, index: true
    add_column :results, :correct_questions, :integer, default: 0
  end
end
