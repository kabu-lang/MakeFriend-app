class CreateCommunities < ActiveRecord::Migration[6.0]
  def change
    create_table :communities do |t|
      t.string   :name,                 null: false
      t.integer  :prefecture_id,        null: false
      t.string   :municipality,         null: false
      t.string   :area_detail,          null: false
      t.integer  :max_people,           null: false, default: 0
      t.integer  :participation_people, null: false, default: 0
      t.datetime :date,                 null: false
      t.timestamps

    end
  end
end
