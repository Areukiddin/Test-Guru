class AddPassagePercentToResults < ActiveRecord::Migration[6.1]
  def change
    add_column :results, :passage_percent, :integer, default: 0
  end
end
