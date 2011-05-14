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

ActiveRecord::Schema.define(:version => 20110514115004) do

  create_table "diagnoses", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "yes_id"
    t.integer  "no_id"
  end

  create_table "diagnoses_parameters", :force => true do |t|
    t.integer  "diagnosis_id"
    t.integer  "parameter_id"
    t.string   "args"
    t.boolean  "return_value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "diagnoses_setups", :force => true do |t|
    t.integer  "diagnosis_id"
    t.integer  "setup_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

# Could not dump table "parameters" because of following StandardError
#   Unknown type 'bool' for column 'initial_question'

  create_table "setups", :force => true do |t|
    t.string   "name"
    t.string   "args"
    t.string   "code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
