class AddStatusToCommunities < ActiveRecord::Migration[6.0]
  def change
    add_column :communities, :status, :integer, default:0
  end
end
