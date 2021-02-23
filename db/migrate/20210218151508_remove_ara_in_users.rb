class RemoveAraInUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :area, :string
  end
end
