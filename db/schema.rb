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

ActiveRecord::Schema[7.0].define(version: 2023_03_04_170415) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "branches", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.bigint "company_id", null: false
    t.index ["company_id"], name: "index_branches_on_company_id"
  end

  create_table "common_failures", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
  end

  create_table "common_failures_tickets", id: false, force: :cascade do |t|
    t.bigint "ticket_id", null: false
    t.bigint "common_failure_id", null: false
    t.index ["common_failure_id"], name: "index_common_failures_tickets_on_common_failure_id"
    t.index ["ticket_id"], name: "index_common_failures_tickets_on_ticket_id"
  end

  create_table "companies", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
  end

  create_table "locations", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "city"
    t.string "state"
    t.string "country"
    t.float "lat"
    t.float "lng"
    t.string "locatable_type"
    t.bigint "locatable_id"
    t.index ["locatable_type", "locatable_id"], name: "index_locations_on_locatable"
  end

  create_table "machines", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tickets", force: :cascade do |t|
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "branch_id"
    t.bigint "assignee_id"
    t.bigint "machine_id"
    t.string "author_type"
    t.bigint "author_id"
    t.integer "status", default: 0
    t.index ["assignee_id"], name: "index_tickets_on_assignee_id"
    t.index ["author_type", "author_id"], name: "index_tickets_on_author"
    t.index ["branch_id"], name: "index_tickets_on_branch_id"
    t.index ["machine_id"], name: "index_tickets_on_machine_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "name"
    t.string "email"
  end

  add_foreign_key "branches", "companies"
  add_foreign_key "tickets", "branches"
  add_foreign_key "tickets", "users", column: "assignee_id"
end
