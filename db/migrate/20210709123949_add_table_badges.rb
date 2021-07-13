class AddTableBadges < ActiveRecord::Migration[6.1]
  def change
    create_table :badges do |t|
      t.string :title, null: false
      t.string :file_name, null: false, default: '/app/assets/images/badge.png'
      t.string :achieved_for, null: false

      t.timestamps
    end

    create_table :own_badges do |t|
      t.references :user, null: false, foreign_key: true
      t.references :badge, null: false, foreign_key: true
      t.index %i[user_id badge_id]

      t.timestamps
    end
  end
end
