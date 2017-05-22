class AddWordIdToDefinitions < ActiveRecord::Migration[5.1]
  def change
    add_column :definitions, :word_id, :integer
  end
end
