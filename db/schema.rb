# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_03_18_141555) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "category_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "category_users", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "category_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_category_users_on_category_id"
    t.index ["user_id"], name: "index_category_users_on_user_id"
  end

  create_table "communities", force: :cascade do |t|
    t.string "name", null: false
    t.integer "prefecture_id", null: false
    t.string "municipality", null: false
    t.string "area_detail", null: false
    t.integer "max_people", default: 0, null: false
    t.integer "participation_people", default: 0, null: false
    t.datetime "date", null: false
    t.bigint "category_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "author"
    t.integer "status", default: 0
    t.index ["category_id"], name: "index_communities_on_category_id"
  end

  create_table "community_messages", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "community_id", null: false
    t.text "content", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["community_id"], name: "index_community_messages_on_community_id"
    t.index ["user_id"], name: "index_community_messages_on_user_id"
  end

  create_table "likes", force: :cascade do |t|
    t.bigint "sender_id"
    t.bigint "receiver_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["receiver_id"], name: "index_likes_on_receiver_id"
    t.index ["sender_id"], name: "index_likes_on_sender_id"
  end

  create_table "second_communities", force: :cascade do |t|
    t.string "name", null: false
    t.integer "prefecture_id", null: false
    t.string "municipality", null: false
    t.string "area_detail", null: false
    t.integer "max_people", null: false
    t.integer "participation_people", null: false
    t.datetime "date", null: false
    t.integer "status", null: false
    t.integer "author", null: false
    t.bigint "category_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_second_communities_on_category_id"
  end

  create_table "user_communities", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "community_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["community_id"], name: "index_user_communities_on_community_id"
    t.index ["user_id"], name: "index_user_communities_on_user_id"
  end

  create_table "user_second_communities", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "second_community_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["second_community_id"], name: "index_user_second_communities_on_second_community_id"
    t.index ["user_id"], name: "index_user_second_communities_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.string "name"
    t.date "birthday"
    t.integer "prefecture_id"
    t.integer "gender"
    t.text "remarks"
    t.string "image_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  add_foreign_key "category_users", "categories"
  add_foreign_key "category_users", "users"
  add_foreign_key "community_messages", "communities"
  add_foreign_key "community_messages", "users"
  add_foreign_key "likes", "users", column: "receiver_id"
  add_foreign_key "likes", "users", column: "sender_id"
  add_foreign_key "second_communities", "categories"
  add_foreign_key "user_communities", "communities"
  add_foreign_key "user_communities", "users"
  add_foreign_key "user_second_communities", "second_communities"
  add_foreign_key "user_second_communities", "users"
end
