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

ActiveRecord::Schema[7.0].define(version: 2017_12_30_022308) do
  create_table "animals", force: :cascade do |t|
    t.string "name"
    t.boolean "active", default: true
  end

  create_table "owners", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "street"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.string "phone"
    t.string "email"
    t.boolean "active", default: true
    t.string "username"
    t.string "password_digest"
    t.integer "role"
  end

  create_table "pets", force: :cascade do |t|
    t.string "name"
    t.integer "animal_id"
    t.integer "owner_id"
    t.boolean "female"
    t.date "date_of_birth"
    t.boolean "active", default: true
    t.index ["animal_id"], name: "index_pets_on_animal_id"
    t.index ["owner_id"], name: "index_pets_on_owner_id"
  end

  create_table "visits", force: :cascade do |t|
    t.integer "pet_id"
    t.date "date"
    t.float "weight"
    t.boolean "overnight_stay"
    t.integer "total_charge"
    t.index ["pet_id"], name: "index_visits_on_pet_id"
  end

  add_foreign_key "pets", "animals"
  add_foreign_key "pets", "owners"
  add_foreign_key "visits", "pets"
end
