class CreateTargets < ActiveRecord::Migration[6.0]
  def change
    create_table :targets do |t|
      t.string :title,         null: false
      t.string :genre_id
      t.date :deadline,        null: false
      t.text :plan,            null: false
      t.string :great_man,     null: false
      t.text :future,          null: false
      t.references :user,      foreign_key: true
      t.timestamps
    end
  end
end
