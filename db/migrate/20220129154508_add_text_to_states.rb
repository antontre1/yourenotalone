class AddTextToStates < ActiveRecord::Migration[6.1]
  def change
    add_column :states, :text, :string
  end
end
