class ChangeDataImageNameToUsers < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :image_name, :string
  end
end
