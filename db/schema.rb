# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_06_11_014217) do
  create_table "arraial_arraials", force: :cascade do |t|
    t.string "name"
    t.datetime "starts_at"
    t.string "address"
    t.integer "min_price"
    t.string "kind"
    t.string "obs"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "carnaval_block_musical_styles", force: :cascade do |t|
    t.integer "block_id", null: false
    t.integer "musical_style_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["block_id", "musical_style_id"], name: "idx_on_block_id_musical_style_id_254ec3c5ca", unique: true
    t.index ["block_id"], name: "index_carnaval_block_musical_styles_on_block_id"
    t.index ["musical_style_id"], name: "index_carnaval_block_musical_styles_on_musical_style_id"
  end

  create_table "carnaval_block_target_audiences", force: :cascade do |t|
    t.integer "block_id", null: false
    t.integer "target_audience_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["block_id", "target_audience_id"], name: "idx_on_block_id_target_audience_id_18b1218a14", unique: true
    t.index ["block_id"], name: "index_carnaval_block_target_audiences_on_block_id"
    t.index ["target_audience_id"], name: "index_carnaval_block_target_audiences_on_target_audience_id"
  end

  create_table "carnaval_blocks", force: :cascade do |t|
    t.string "name"
    t.string "starting_point"
    t.float "latitude"
    t.float "longitude"
    t.datetime "starts_at"
    t.string "size"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "carnaval_musical_styles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_carnaval_musical_styles_on_name", unique: true
  end

  create_table "carnaval_target_audiences", force: :cascade do |t|
    t.string "name"
    t.string "emoji"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["emoji"], name: "index_carnaval_target_audiences_on_emoji", unique: true
  end

  create_table "imported_spreadsheets", force: :cascade do |t|
    t.binary "response_body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "url"
    t.string "event_type"
  end

  add_foreign_key "carnaval_block_musical_styles", "carnaval_blocks", column: "block_id"
  add_foreign_key "carnaval_block_musical_styles", "carnaval_musical_styles", column: "musical_style_id"
  add_foreign_key "carnaval_block_target_audiences", "carnaval_blocks", column: "block_id"
  add_foreign_key "carnaval_block_target_audiences", "carnaval_target_audiences", column: "target_audience_id"
end
