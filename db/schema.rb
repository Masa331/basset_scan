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

ActiveRecord::Schema.define(version: 20150130181836) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "invoices", force: true do |t|
    t.string   "variable_symbol",   limit: nil
    t.string   "specific_symbol",   limit: nil
    t.string   "constant_symbol",   limit: nil
    t.string   "supplier_name",     limit: nil
    t.float    "total_price"
    t.string   "invoice_text",      limit: nil
    t.datetime "tax_point_date"
    t.datetime "payemnt_due_date"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "scan_file_name",    limit: nil
    t.string   "scan_content_type", limit: nil
    t.integer  "scan_file_size"
    t.datetime "scan_updated_at"
    t.string   "note"
    t.string   "centre"
    t.string   "transporter"
    t.string   "payment_means"
    t.string   "bank_code"
    t.string   "account_number"
    t.string   "currency_id"
    t.string   "discount"
    t.string   "iban"
    t.string   "item_product"
    t.string   "item_quantity"
    t.string   "item_discount"
    t.string   "expiration"
    t.string   "serial_number"
    t.string   "unit_price"
    t.string   "item_centre"
    t.string   "item_series"
    t.string   "item_vat_rate"
    t.string   "unit_centre"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
