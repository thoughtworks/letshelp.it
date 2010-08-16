# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100811100000) do

  create_table "organizations", :force => true do |t|
    t.string   "name"
    t.string   "_name"
    t.string   "contact"
    t.string   "city"
    t.string   "_city"
    t.string   "country"
    t.text     "needs"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "organizations_tags", :id => false, :force => true do |t|
    t.integer "organization_id"
    t.integer "tag_id"
  end

  create_table "tags", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
