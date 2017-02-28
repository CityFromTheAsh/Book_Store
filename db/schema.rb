# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170228105947) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "books", force: :cascade do |t|
    t.string   "title"
    t.string   "author"
    t.decimal  "price"
    t.integer  "page_count"
    t.string   "about"
    t.boolean  "binding"
    t.string   "genre"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.integer  "user_id"
    t.integer  "image_id"
    t.string   "status",              default: "for sale", null: false
    t.integer  "order_id"
    t.integer  "message_id"
    t.integer  "last_bought_book_id"
    t.index ["image_id"], name: "index_books_on_image_id", using: :btree
    t.index ["last_bought_book_id"], name: "index_books_on_last_bought_book_id", using: :btree
    t.index ["message_id"], name: "index_books_on_message_id", using: :btree
    t.index ["order_id"], name: "index_books_on_order_id", using: :btree
    t.index ["user_id"], name: "index_books_on_user_id", using: :btree
  end

  create_table "contacts", force: :cascade do |t|
    t.string   "firstname",  default: "", null: false
    t.string   "lastname",   default: "", null: false
    t.string   "email",      default: "", null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "images", force: :cascade do |t|
    t.string   "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "book_id"
    t.string   "owner"
    t.string   "title"
    t.index ["book_id"], name: "index_images_on_book_id", using: :btree
  end

  create_table "messages", force: :cascade do |t|
    t.string   "message"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "user_id"
    t.boolean  "hide",         default: false, null: false
    t.integer  "book_id"
    t.integer  "sender_id"
    t.integer  "recipient_id"
    t.index ["book_id"], name: "index_messages_on_book_id", using: :btree
    t.index ["recipient_id"], name: "index_messages_on_recipient_id", using: :btree
    t.index ["sender_id"], name: "index_messages_on_sender_id", using: :btree
    t.index ["user_id"], name: "index_messages_on_user_id", using: :btree
  end

  create_table "options", force: :cascade do |t|
    t.string   "language"
    t.integer  "book_per_page", default: 25
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "user_id"
    t.index ["user_id"], name: "index_options_on_user_id", using: :btree
  end

  create_table "orders", force: :cascade do |t|
    t.string   "buyer"
    t.string   "admin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "book_id"
    t.integer  "user_id"
    t.index ["book_id"], name: "index_orders_on_book_id", using: :btree
    t.index ["user_id"], name: "index_orders_on_user_id", using: :btree
  end

  create_table "recall", force: :cascade do |t|
    t.text     "recall"
    t.integer  "mark"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "admin"
    t.string   "login",                  default: "",    null: false
    t.decimal  "balance",                default: "0.0", null: false
    t.integer  "books_id"
    t.string   "avatar"
    t.integer  "books_sold",             default: 0
    t.integer  "books_bought",           default: 0
    t.float    "reputation",             default: 0.0
    t.boolean  "ban",                    default: false
    t.integer  "message_id"
    t.integer  "option_id"
    t.index ["books_id"], name: "index_users_on_books_id", using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["message_id"], name: "index_users_on_message_id", using: :btree
    t.index ["option_id"], name: "index_users_on_option_id", using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "books", "images"
  add_foreign_key "books", "messages"
  add_foreign_key "books", "orders"
  add_foreign_key "books", "users"
  add_foreign_key "books", "users", column: "last_bought_book_id"
  add_foreign_key "images", "books"
  add_foreign_key "messages", "books"
  add_foreign_key "messages", "users"
  add_foreign_key "messages", "users", column: "recipient_id"
  add_foreign_key "messages", "users", column: "sender_id"
  add_foreign_key "orders", "books"
  add_foreign_key "orders", "users"
  add_foreign_key "users", "books", column: "books_id"
  add_foreign_key "users", "messages"
end
