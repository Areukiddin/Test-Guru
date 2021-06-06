class AddUniqueIndex < ActiveRecord::Migration[6.1]
  def change
    add_index :categories, :title, unique: true
    add_index :users, :email, unique: true
    add_index :tests, %i[title level], unique: true
  end
end
