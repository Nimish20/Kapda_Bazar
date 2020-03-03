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

ActiveRecord::Schema.define(version: 2020_02_27_111903) do

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

  create_table "cart_items", force: :cascade do |t|
    t.string "product_name"
    t.money "rent_cost", scale: 2
    t.money "price", scale: 2
    t.bigint "product_id", null: false
    t.bigint "cart_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cart_id"], name: "index_cart_items_on_cart_id"
    t.index ["product_id"], name: "index_cart_items_on_product_id"
  end

  create_table "carts", force: :cascade do |t|
    t.string "status", default: "active"
    t.bigint "customer_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customer_id"], name: "index_carts_on_customer_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.text "discription"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string "name"
    t.bigint "number"
    t.text "address"
    t.string "postal_code"
    t.string "gender"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.index ["confirmation_token"], name: "index_customers_on_confirmation_token", unique: true
    t.index ["email"], name: "index_customers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_customers_on_reset_password_token", unique: true
  end

  create_table "delivery_boys", force: :cascade do |t|
    t.string "name"
    t.bigint "phone_number"
    t.text "address"
    t.string "email"
    t.string "password"
    t.bigint "store_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["store_id"], name: "index_delivery_boys_on_store_id"
  end

  create_table "order_lines", force: :cascade do |t|
    t.string "product_name"
    t.money "rent_cost", scale: 2
    t.money "price", scale: 2
    t.bigint "product_id", null: false
    t.bigint "order_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["order_id"], name: "index_order_lines_on_order_id"
    t.index ["product_id"], name: "index_order_lines_on_product_id"
  end

  create_table "orders", force: :cascade do |t|
    t.money "total_amount", scale: 2
    t.money "total_rent", scale: 2
    t.money "refund_amount", scale: 2
    t.string "status"
    t.string "payment_mode"
    t.string "payment_status"
    t.date "order_date"
    t.daterange "time_period"
    t.bigint "customer_id", null: false
    t.bigint "delivery_boy_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "cart_id"
    t.index ["cart_id"], name: "index_orders_on_cart_id"
    t.index ["customer_id"], name: "index_orders_on_customer_id"
    t.index ["delivery_boy_id"], name: "index_orders_on_delivery_boy_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.string "color"
    t.string "size"
    t.boolean "availability", default: true
    t.money "price", scale: 2
    t.money "rent_cost", scale: 2
    t.bigint "store_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "category_id"
    t.index ["category_id"], name: "index_products_on_category_id"
    t.index ["store_id"], name: "index_products_on_store_id"
  end

  create_table "sellers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "first_name"
    t.string "last_name"
    t.bigint "number"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["confirmation_token"], name: "index_sellers_on_confirmation_token", unique: true
    t.index ["email"], name: "index_sellers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_sellers_on_reset_password_token", unique: true
  end

  create_table "stores", force: :cascade do |t|
    t.string "name"
    t.text "address"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "seller_id"
    t.index ["seller_id"], name: "index_stores_on_seller_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "cart_items", "carts"
  add_foreign_key "cart_items", "products"
  add_foreign_key "carts", "customers"
  add_foreign_key "delivery_boys", "stores"
  add_foreign_key "order_lines", "orders"
  add_foreign_key "order_lines", "products"
  add_foreign_key "orders", "carts"
  add_foreign_key "orders", "customers"
  add_foreign_key "orders", "delivery_boys"
  add_foreign_key "products", "categories"
  add_foreign_key "products", "stores"
  add_foreign_key "stores", "sellers"
end
