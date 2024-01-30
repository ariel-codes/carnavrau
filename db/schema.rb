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

ActiveRecord::Schema[7.1].define(version: 2024_01_30_062709) do
  create_table "block_musical_styles", id: false, force: :cascade do |t|
    t.integer "block_id", null: false
    t.integer "target_audience_id", null: false
    t.index ["block_id", "target_audience_id"], name: "index_block_musical_styles_on_block_id_and_target_audience_id"
    t.index ["target_audience_id", "block_id"], name: "index_block_musical_styles_on_target_audience_id_and_block_id"
  end

  create_table "block_target_audiences", id: false, force: :cascade do |t|
    t.integer "block_id", null: false
    t.integer "musical_style_id", null: false
    t.index ["block_id", "musical_style_id"], name: "index_block_target_audiences_on_block_id_and_musical_style_id"
    t.index ["musical_style_id", "block_id"], name: "index_block_target_audiences_on_musical_style_id_and_block_id"
  end

  create_table "blocks", force: :cascade do |t|
    t.string "name"
    t.string "starting_point"
    t.float "latitude"
    t.float "longitude"
    t.datetime "starts_at"
    t.string "size"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "musical_styles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "target_audiences", force: :cascade do |t|
    t.string "name"
    t.string "emoji"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
