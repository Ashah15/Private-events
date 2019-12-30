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

ActiveRecord::Schema.define(version: 2019_12_25_180906) do

  create_table "attendees", force: :cascade do |t|
    t.string "name"
    t.integer "attendee_id"
    t.integer "attended_event_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["attended_event_id"], name: "index_attendees_on_attended_event_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "name"
    t.string "venue"
    t.string "time"
    t.datetime "event_date"
    t.string "description"
    t.integer "creator_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["creator_id", "created_at"], name: "index_events_on_creator_id_and_created_at"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "remember_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
