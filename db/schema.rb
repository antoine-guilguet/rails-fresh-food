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

ActiveRecord::Schema.define(version: 20180208113451) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "leads", force: :cascade do |t|
    t.string "address"
    t.string "street_number"
    t.string "route"
    t.string "locality"
    t.string "country"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.float "price"
    t.string "producer"
    t.string "origin"
    t.integer "rating"
    t.integer "quantity"
    t.string "measure"
    t.string "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sourcings", force: :cascade do |t|
    t.string "produit"
    t.string "exigence"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
