class CreateFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :favorites do |t|
      t.references :user, null: false, foreign_key: true
      t.string :details
      t.references :favoritable, polymorphic: true, null: false
      t.timestamps
    end
  end
end
