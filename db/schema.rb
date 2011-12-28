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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20111245152430) do

  create_table "categories", :force => true do |t|
    t.string   "description"
    t.string   "color"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "expenses", :force => true do |t|
    t.decimal  "amount",      :precision => 14, :scale => 2, :null => false
    t.datetime "due_date",                                   :null => false
    t.string   "description",                                :null => false
    t.integer  "user_id",                                    :null => false
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "expenses", ["category_id"], :name => "index_expenses_on_category_id"
  add_index "expenses", ["user_id"], :name => "index_expenses_on_user_id"

  create_table "incomes", :force => true do |t|
    t.decimal  "amount",         :precision => 14, :scale => 2, :null => false
    t.datetime "date_of_credit",                                :null => false
    t.string   "description",                                   :null => false
    t.integer  "user_id",                                       :null => false
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "incomes", ["category_id"], :name => "index_incomes_on_category_id"
  add_index "incomes", ["user_id"], :name => "index_incomes_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "name",                                                  :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
