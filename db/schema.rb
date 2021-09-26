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

ActiveRecord::Schema.define(version: 2021_09_24_194954) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "address_line_1"
    t.string "address_line_2"
    t.string "city"
    t.string "state"
    t.integer "postal_code"
    t.integer "company_id"
    t.string "address_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["city"], name: "index_addresses_on_city"
    t.index ["company_id"], name: "index_addresses_on_company_id"
    t.index ["state"], name: "index_addresses_on_state"
  end

  create_table "business_structures", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_business_structures_on_name"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "avatar_url"
    t.integer "business_structure_id"
    t.string "duns_number"
    t.integer "naics_code_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["business_structure_id"], name: "index_companies_on_business_structure_id"
    t.index ["naics_code_id"], name: "index_companies_on_naics_code_id"
    t.index ["name"], name: "index_companies_on_name"
  end

  create_table "naics_codes", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "code"
    t.integer "sector_id"
    t.integer "subsector_id"
    t.integer "industry_group_id"
    t.integer "naics_industry_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["code"], name: "index_naics_codes_on_code"
    t.index ["industry_group_id"], name: "index_naics_codes_on_industry_group_id"
    t.index ["naics_industry_id"], name: "index_naics_codes_on_naics_industry_id"
    t.index ["sector_id"], name: "index_naics_codes_on_sector_id"
    t.index ["subsector_id"], name: "index_naics_codes_on_subsector_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "addresses", "companies"
  add_foreign_key "companies", "business_structures"
  add_foreign_key "companies", "naics_codes"
end
