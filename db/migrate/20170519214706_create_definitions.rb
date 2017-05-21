class CreateDefinitions < ActiveRecord::Migration[5.1]
  def change
    create_table :definitions do |t|
      t.string :word
      t.text :definition
      t.string :URL

      t.timestamps
    end
  end
end
