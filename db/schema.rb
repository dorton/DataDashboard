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

ActiveRecord::Schema.define(:version => 20130311182149) do

  create_table "admins", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "admins", ["email"], :name => "index_admins_on_email", :unique => true
  add_index "admins", ["reset_password_token"], :name => "index_admins_on_reset_password_token", :unique => true

  create_table "appraisers", :force => true do |t|
    t.string   "last_name"
    t.string   "first_name"
    t.string   "email"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "campus", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "learningwalks", :force => true do |t|
    t.string   "observer"
    t.string   "subject"
    t.string   "highlights"
    t.string   "growths"
    t.integer  "teacher_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.datetime "start_time"
    t.string   "campus"
  end

  add_index "learningwalks", ["teacher_id"], :name => "index_learningwalks_on_teacher_id"

  create_table "lessonplans", :force => true do |t|
    t.string   "lesson_plan"
    t.string   "name"
    t.string   "campus"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "observations", :force => true do |t|
    t.string   "on_task"
    t.string   "observer"
    t.integer  "student_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "notes"
    t.boolean  "off_task"
    t.string   "campus"
  end

  add_index "observations", ["student_id"], :name => "index_observations_on_student_id"

  create_table "rails_admin_histories", :force => true do |t|
    t.text     "message"
    t.string   "username"
    t.integer  "item"
    t.string   "table"
    t.integer  "month",      :limit => 2
    t.integer  "year",       :limit => 5
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  add_index "rails_admin_histories", ["item", "table", "month", "year"], :name => "index_rails_admin_histories"

  create_table "searches", :force => true do |t|
    t.string   "keywords"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "students", :force => true do |t|
    t.string   "last_name"
    t.string   "first_name"
    t.string   "stu_id"
    t.boolean  "met_math_ayp",         :default => true
    t.boolean  "met_reading_ayp",      :default => true
    t.boolean  "bubble_math",          :default => false
    t.boolean  "bubble_reading",       :default => false
    t.integer  "teacher_id"
    t.datetime "created_at",                              :null => false
    t.datetime "updated_at",                              :null => false
    t.string   "avatar"
    t.string   "math_nce"
    t.string   "reading_nce"
    t.string   "reading_staar_scale"
    t.string   "math_staar_scale"
    t.boolean  "sped"
    t.string   "elar_cat_1"
    t.string   "elar_cat_2"
    t.string   "elar_cat_3"
    t.string   "math_cat_1"
    t.string   "math_cat_2"
    t.string   "math_cat_3"
    t.string   "math_cat_4"
    t.string   "math_cat_5"
    t.string   "science_cat_1"
    t.string   "science_cat_2"
    t.string   "science_cat_3"
    t.string   "science_cat_4"
    t.string   "writing_cat_1"
    t.string   "writing_cat_2"
    t.string   "writing_cat_3"
    t.string   "science_staar_scale"
    t.string   "writing_staar_scale"
    t.boolean  "met_reading_standard"
    t.string   "reading_test_version"
    t.boolean  "met_math_standard"
    t.string   "math_test_version"
    t.string   "depart_class"
    t.string   "campus"
  end

  add_index "students", ["teacher_id"], :name => "index_students_on_teacher_id"
  add_index "students", ["teacher_id"], :name => "student_index"

  create_table "teachers", :force => true do |t|
    t.string   "last_name"
    t.string   "first_name"
    t.string   "grade"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "email_old"
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "email"
    t.integer  "appraiser_id"
    t.string   "apprai"
    t.string   "apprai_email"
    t.string   "role"
    t.boolean  "departmental"
    t.string   "depart_class"
    t.boolean  "superuser"
    t.string   "campus"
    t.integer  "campus_id"
    t.string   "lesson_plan"
  end

  add_index "teachers", ["appraiser_id"], :name => "index_teachers_on_appraiser_id"
  add_index "teachers", ["email"], :name => "index_teachers_on_email", :unique => true
  add_index "teachers", ["reset_password_token"], :name => "index_teachers_on_reset_password_token", :unique => true

end
