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

ActiveRecord::Schema.define(version: 2020_09_08_004540) do

  create_table "categories", force: :cascade do |t|
    t.integer "store_id", null: false
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["store_id"], name: "index_categories_on_store_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "price_cents"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "orders_products_joins", force: :cascade do |t|
    t.integer "product_id", null: false
    t.integer "order_id", null: false
    t.integer "quantity"
    t.integer "price_cents"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["order_id"], name: "index_orders_products_joins_on_order_id"
    t.index ["product_id"], name: "index_orders_products_joins_on_product_id"
  end

  create_table "products", force: :cascade do |t|
    t.text "description"
    t.string "name"
    t.integer "quantity"
    t.integer "price_cents"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "store_id", null: false
    t.index ["store_id"], name: "index_products_on_store_id"
  end

  create_table "products_categories_joins", force: :cascade do |t|
    t.integer "product_id", null: false
    t.integer "category_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_products_categories_joins_on_category_id"
    t.index ["product_id"], name: "index_products_categories_joins_on_product_id"
  end

  create_table "stores", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_stores_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "categories", "stores"
  add_foreign_key "orders_products_joins", "orders"
  add_foreign_key "orders_products_joins", "products"
  add_foreign_key "products", "stores"
  add_foreign_key "products_categories_joins", "categories"
  add_foreign_key "products_categories_joins", "products"
  add_foreign_key "stores", "users"
end
