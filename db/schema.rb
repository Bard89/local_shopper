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

ActiveRecord::Schema.define(version: 2021_06_08_142301) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "chatrooms", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "gift_request_id", null: false
    t.index ["gift_request_id"], name: "index_chatrooms_on_gift_request_id"
  end

  create_table "gift_requests", force: :cascade do |t|
    t.string "recipient_name"
    t.string "recipient_address"
    t.date "delivery_due_date"
    t.integer "budget"
    t.string "packaging"
    t.text "comment"
    t.string "status", default: "pending"
    t.integer "requester_id"
    t.integer "shopper_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "product1"
    t.string "product2"
    t.string "product3"
    t.string "shop1"
    t.string "shop2"
    t.string "shop3"
    t.integer "price_cents", default: 0, null: false
    t.string "checkout_session_id"
    t.float "latitude"
    t.float "longitude"
    t.index ["requester_id"], name: "index_gift_requests_on_requester_id"
    t.index ["shopper_id"], name: "index_gift_requests_on_shopper_id"
  end

  create_table "messages", force: :cascade do |t|
    t.string "content"
    t.bigint "chatroom_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["chatroom_id"], name: "index_messages_on_chatroom_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "rating"
    t.text "review"
    t.bigint "gift_request_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["gift_request_id"], name: "index_reviews_on_gift_request_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name"
    t.string "last_name"
    t.string "location"
    t.string "profile_picture"
    t.date "date_of_birth"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "chatrooms", "gift_requests"
  add_foreign_key "messages", "chatrooms"
  add_foreign_key "messages", "users"
end
