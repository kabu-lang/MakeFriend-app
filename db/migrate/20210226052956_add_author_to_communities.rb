class AddAuthorToCommunities < ActiveRecord::Migration[6.0]
  def change
    add_column :communities, :author, :integer
  end
end
