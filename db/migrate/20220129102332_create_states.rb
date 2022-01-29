class CreateStates < ActiveRecord::Migration[6.1]
  def change
    create_table :states do |t|
      t.integer :emotional_state

      t.timestamps
    end
  end
end
