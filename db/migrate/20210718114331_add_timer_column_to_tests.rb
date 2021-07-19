class AddTimerColumnToTests < ActiveRecord::Migration[6.1]
  def change
    add_column :tests, :minutes_for_passing, :integer, default: 10
  end
end
