class CreateFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :favorites do |t|
      t.references :user, null: false, foreign_key: true
      t.references :favoritable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
# la commande ayant permis de faire ceci est : rails g model favorite user:references favoritable:references{polymorphic}
