class ChangeDataAreaToUsers < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :area, :integer
  end
end
