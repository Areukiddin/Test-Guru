class AddAttrsDefaultValue < ActiveRecord::Migration[6.1]
  def change
    add_column :tests, :level, :integer, default: 0
    change_column_default :answers, :correct, false
  end
end
