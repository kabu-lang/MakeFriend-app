class AddColumnToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string
    add_column :users, :birthday, :date
    add_column :users, :area, :string
    add_column :users, :gender, :integer
    add_column :users, :remarks, :text
    add_column :users, :image_name, :string
  end
end
