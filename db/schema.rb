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

ActiveRecord::Schema[7.1].define(version: 2024_05_29_074357) do
  create_table "projects", id: { type: :string, limit: 26 }, charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.bigint "partition_key", null: false, comment: "Sequential number for analysis", auto_increment: true
    t.string "name", null: false
    t.integer "color", limit: 2, default: 0, null: false
    t.integer "view_style", limit: 1, default: 0, null: false
    t.boolean "is_shared", default: false, null: false
    t.boolean "is_favorite", default: false, null: false
    t.boolean "is_archived", default: false, null: false
    t.integer "order", null: false
    t.string "description"
    t.string "user_id", limit: 26
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order"], name: "index_projects_on_order", unique: true
    t.index ["partition_key"], name: "index_projects_on_partition_key"
    t.index ["user_id"], name: "index_projects_on_user_id"
  end

  create_table "tagged_tasks", id: { type: :string, limit: 26 }, charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.bigint "partition_key", null: false, comment: "Sequential number for analysis", auto_increment: true
    t.string "user_id", limit: 26
    t.string "task_id", limit: 26
    t.string "tag_id", limit: 26
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["partition_key"], name: "index_tagged_tasks_on_partition_key"
    t.index ["tag_id"], name: "index_tagged_tasks_on_tag_id"
    t.index ["task_id"], name: "index_tagged_tasks_on_task_id"
    t.index ["user_id"], name: "index_tagged_tasks_on_user_id"
  end

  create_table "tags", id: { type: :string, limit: 26 }, charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.bigint "partition_key", null: false, comment: "Sequential number for analysis", auto_increment: true
    t.string "name", null: false
    t.string "user_id", limit: 26
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["partition_key"], name: "index_tags_on_partition_key"
    t.index ["user_id"], name: "index_tags_on_user_id"
  end

  create_table "tasks", id: { type: :string, limit: 26 }, charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.bigint "partition_key", null: false, comment: "Sequential number for analysis", auto_increment: true
    t.string "name", null: false
    t.integer "priority", limit: 1, default: 1, null: false
    t.datetime "due_date", comment: "Due Date"
    t.integer "status", limit: 1, default: 0, null: false
    t.string "description"
    t.string "user_id", limit: 26
    t.string "project_id", limit: 26
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["partition_key"], name: "index_tasks_on_partition_key"
    t.index ["project_id"], name: "index_tasks_on_project_id"
    t.index ["user_id"], name: "index_tasks_on_user_id"
  end

  create_table "users", id: { type: :string, limit: 26 }, charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.bigint "partition_key", null: false, comment: "Sequential number for analysis", auto_increment: true
    t.string "first_name", null: false, comment: "First Name"
    t.string "last_name", null: false, comment: "Last Name"
    t.string "email", null: false, comment: "Email address"
    t.string "password", null: false, comment: "Encrypted Password"
    t.string "reset_password_token", comment: "Reset Password Token"
    t.datetime "reset_password_sent_at", comment: "Reset Password Sent At"
    t.datetime "remember_created_at", comment: "Remember Created At"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["partition_key"], name: "index_users_on_partition_key"
  end

  add_foreign_key "projects", "users"
  add_foreign_key "tagged_tasks", "tags"
  add_foreign_key "tagged_tasks", "tasks"
  add_foreign_key "tagged_tasks", "users"
  add_foreign_key "tags", "users"
  add_foreign_key "tasks", "projects"
  add_foreign_key "tasks", "users"
end
