class CreateVotes < ActiveRecord::Migration[6.1]
  def change
    create_table :votes do |t|
      t.integer :reaction
      t.references :users, null: false, foreign_key: true
      t.references :articles, null: false, foreign_key: true

      t.timestamps
    end
  end
end
