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

ActiveRecord::Schema.define(version: 2021_03_28_152616) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "addresses", force: :cascade do |t|
    t.string "street_number"
    t.string "street_name"
    t.bigint "suburb_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["suburb_id"], name: "index_addresses_on_suburb_id"
  end

  create_table "events", force: :cascade do |t|
    t.date "date"
    t.time "time"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "address_id"
    t.bigint "user_id"
    t.boolean "listed"
    t.integer "price"
    t.index ["address_id"], name: "index_events_on_address_id"
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "events_look_a_likes", force: :cascade do |t|
    t.bigint "event_id", null: false
    t.bigint "look_a_like_id", null: false
    t.bigint "movie_id"
    t.boolean "look_a_like_accepted"
    t.boolean "host_accepted"
    t.boolean "invite"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "price", default: 50
    t.index ["event_id"], name: "index_events_look_a_likes_on_event_id"
    t.index ["look_a_like_id"], name: "index_events_look_a_likes_on_look_a_like_id"
    t.index ["movie_id"], name: "index_events_look_a_likes_on_movie_id"
  end

  create_table "images", force: :cascade do |t|
    t.string "imageable_type", null: false
    t.bigint "imageable_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["imageable_type", "imageable_id"], name: "index_images_on_imageable_type_and_imageable_id"
  end

  create_table "look_a_likes", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "bio"
    t.bigint "image_id"
    t.index ["image_id"], name: "index_look_a_likes_on_image_id"
  end

  create_table "movies", force: :cascade do |t|
    t.string "title"
    t.date "year"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "movies_events", force: :cascade do |t|
    t.bigint "event_id", null: false
    t.bigint "movie_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["event_id"], name: "index_movies_events_on_event_id"
    t.index ["movie_id"], name: "index_movies_events_on_movie_id"
  end

  create_table "suburbs", force: :cascade do |t|
    t.string "name"
    t.integer "postcode"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "suburbs_look_a_likes", force: :cascade do |t|
    t.bigint "suburb_id", null: false
    t.bigint "look_a_like_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["look_a_like_id"], name: "index_suburbs_look_a_likes_on_look_a_like_id"
    t.index ["suburb_id"], name: "index_suburbs_look_a_likes_on_suburb_id"
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
    t.bigint "address_id"
    t.bigint "look_a_like_id"
    t.bigint "image_id"
    t.index ["address_id"], name: "index_users_on_address_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["image_id"], name: "index_users_on_image_id"
    t.index ["look_a_like_id"], name: "index_users_on_look_a_like_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "addresses", "suburbs"
  add_foreign_key "events", "addresses"
  add_foreign_key "events", "users"
  add_foreign_key "events_look_a_likes", "events"
  add_foreign_key "events_look_a_likes", "look_a_likes"
  add_foreign_key "events_look_a_likes", "movies"
  add_foreign_key "look_a_likes", "images"
  add_foreign_key "movies_events", "events"
  add_foreign_key "movies_events", "movies"
  add_foreign_key "suburbs_look_a_likes", "look_a_likes"
  add_foreign_key "suburbs_look_a_likes", "suburbs"
  add_foreign_key "users", "addresses"
  add_foreign_key "users", "images"
  add_foreign_key "users", "look_a_likes"
end
