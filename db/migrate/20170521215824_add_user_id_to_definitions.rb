class AddUserIdToDefinitions < ActiveRecord::Migration[5.1]
  def change
    add_column :definitions, :user_id, :integer
  end
end
