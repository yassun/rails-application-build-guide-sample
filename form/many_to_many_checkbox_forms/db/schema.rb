# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20141103073210) do

  create_table "categories", force: true, comment: "カテゴリ" do |t|
    t.string   "name",       limit: 50, null: false, comment: "カテゴリ名"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "product_categories", force: true, comment: "商品カテゴリ" do |t|
    t.integer  "product_id",  null: false, comment: "商品ID"
    t.integer  "category_id", null: false, comment: "カテゴリID"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "product_categories", ["category_id"], name: "product_categories_category_id_fk", using: :btree
  add_index "product_categories", ["product_id"], name: "product_categories_product_id_fk", using: :btree

  create_table "products", force: true, comment: "商品" do |t|
    t.string   "code",          limit: 10,              null: false, comment: "商品コード"
    t.string   "name",          limit: 50,              null: false, comment: "商品名"
    t.string   "name_kana",     limit: 50, default: "", null: false, comment: "商品名カナ"
    t.integer  "price",                                 null: false, comment: "商品価格"
    t.integer  "purchase_cost",                         null: false, comment: "仕入原価"
    t.boolean  "availability",                          null: false, comment: "販売可能フラグ"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  add_foreign_key "product_categories", "categories", name: "product_categories_category_id_fk"
  add_foreign_key "product_categories", "products", name: "product_categories_product_id_fk"

end
