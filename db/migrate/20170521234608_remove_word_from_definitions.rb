class RemoveWordFromDefinitions < ActiveRecord::Migration[5.1]
  def change
    remove_column :definitions, :word, :string
  end
end
