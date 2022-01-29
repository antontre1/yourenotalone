class RemoveDetailFromFavorites < ActiveRecord::Migration[6.1]
  def change
    remove_column :favorites, :details, :string
  end
end
