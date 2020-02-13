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

ActiveRecord::Schema.define(version: 2020_02_10_141906) do

  create_table "access_keys", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "key"
    t.datetime "start_period"
    t.datetime "end_period"
    t.boolean "isUsed"
    t.boolean "isTestingKey"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "accesses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.boolean "toCreate"
    t.boolean "toRead"
    t.boolean "toUpdate"
    t.boolean "toDelete"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "branches", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.boolean "main"
    t.string "name"
    t.string "cnpj"
    t.bigint "membership_id"
    t.string "zip_code"
    t.string "neighborhood"
    t.string "street"
    t.string "number"
    t.string "state"
    t.string "state_registration"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["membership_id"], name: "index_branches_on_membership_id"
  end

  create_table "cards", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "cpf"
    t.string "number"
    t.datetime "validate"
    t.string "security_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "colors", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "companies", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "cnpj"
    t.string "business_name"
    t.string "rg"
    t.string "neighborhood"
    t.string "street"
    t.string "number"
    t.string "state"
    t.string "city"
    t.string "zip_code"
    t.string "state_registration"
    t.bigint "membership_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["membership_id"], name: "index_companies_on_membership_id"
  end

  create_table "contacts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "phone"
    t.string "email"
    t.bigint "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_contacts_on_company_id"
  end

  create_table "diaries", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "hr_observation"
    t.string "third_observation"
    t.string "observation"
    t.datetime "start"
    t.datetime "end"
    t.bigint "work_id"
    t.bigint "weather_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["weather_id"], name: "index_diaries_on_weather_id"
    t.index ["work_id"], name: "index_diaries_on_work_id"
  end

  create_table "documents", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "path"
    t.bigint "diary_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["diary_id"], name: "index_documents_on_diary_id"
  end

  create_table "employees", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.bigint "job_id"
    t.bigint "work_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["job_id"], name: "index_employees_on_job_id"
    t.index ["work_id"], name: "index_employees_on_work_id"
  end

  create_table "jobs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "description"
    t.boolean "third"
    t.float "salary"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "branch_id"
    t.index ["branch_id"], name: "index_jobs_on_branch_id"
  end

  create_table "memberships", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "cnpj"
    t.boolean "active"
    t.bigint "card_id"
    t.bigint "access_key_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["access_key_id"], name: "index_memberships_on_access_key_id"
    t.index ["card_id"], name: "index_memberships_on_card_id"
  end

  create_table "presences", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.boolean "isPresent"
    t.time "period"
    t.bigint "diary_id"
    t.bigint "employee_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["diary_id"], name: "index_presences_on_diary_id"
    t.index ["employee_id"], name: "index_presences_on_employee_id"
  end

  create_table "schedules", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.date "day"
    t.integer "position"
    t.bigint "work_id"
    t.bigint "task_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["task_id"], name: "index_schedules_on_task_id"
    t.index ["work_id"], name: "index_schedules_on_work_id"
  end

  create_table "tasks", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "description"
    t.boolean "isFinished"
    t.string "justification"
    t.integer "priority"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "color_id"
    t.bigint "work_id"
    t.index ["color_id"], name: "index_tasks_on_color_id"
    t.index ["work_id"], name: "index_tasks_on_work_id"
  end

  create_table "user_types", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.bigint "user_type_id"
    t.bigint "access_id"
    t.bigint "branch_id"
    t.bigint "job_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["access_id"], name: "index_users_on_access_id"
    t.index ["branch_id"], name: "index_users_on_branch_id"
    t.index ["job_id"], name: "index_users_on_job_id"
    t.index ["user_type_id"], name: "index_users_on_user_type_id"
  end

  create_table "weathers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "type"
    t.boolean "impracticable"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "works", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.date "start"
    t.date "end"
    t.boolean "isFinished"
    t.string "budget"
    t.bigint "company_id"
    t.bigint "user_id"
    t.bigint "branch_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["branch_id"], name: "index_works_on_branch_id"
    t.index ["company_id"], name: "index_works_on_company_id"
    t.index ["user_id"], name: "index_works_on_user_id"
  end

  add_foreign_key "branches", "memberships"
  add_foreign_key "companies", "memberships"
  add_foreign_key "contacts", "companies"
  add_foreign_key "diaries", "weathers"
  add_foreign_key "diaries", "works"
  add_foreign_key "documents", "diaries"
  add_foreign_key "employees", "jobs"
  add_foreign_key "employees", "works"
  add_foreign_key "jobs", "branches"
  add_foreign_key "presences", "diaries"
  add_foreign_key "presences", "employees"
  add_foreign_key "schedules", "tasks"
  add_foreign_key "schedules", "works"
  add_foreign_key "tasks", "colors"
  add_foreign_key "tasks", "works"
  add_foreign_key "users", "accesses"
  add_foreign_key "users", "branches"
  add_foreign_key "users", "jobs"
  add_foreign_key "users", "user_types"
  add_foreign_key "works", "branches"
  add_foreign_key "works", "companies"
  add_foreign_key "works", "users"
end
