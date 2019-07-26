class AddRandomToCocktails < ActiveRecord::Migration[5.2]
  def change
    add_column :cocktails, :random, :boolean, default: false
  end
end
