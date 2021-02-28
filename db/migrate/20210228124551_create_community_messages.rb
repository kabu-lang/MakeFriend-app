class CreateCommunityMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :community_messages do |t|
      t.references :user,      null: false, foreign_key: true
      t.references :community, null: false, foreign_key: true
      t.text       :content,   null: false
      t.timestamps
    end
  end
end
