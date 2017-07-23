class AddSlugToWords < ActiveRecord::Migration[5.1]
  def change
    add_column :words, :rails, :string
    add_column :words, :slug, :string
    add_index :words, :slug, unique: true
  end
end
