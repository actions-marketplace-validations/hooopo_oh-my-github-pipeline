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

ActiveRecord::Schema[7.0].define(version: 2023_03_14_084634) do
  create_table "commit_comments", charset: "utf8mb4", collation: "utf8mb4_bin", force: :cascade do |t|
    t.bigint "repo_id"
    t.bigint "user_id"
    t.string "author_association"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "curr_user", charset: "utf8mb4", collation: "utf8mb4_bin", force: :cascade do |t|
    t.string "login", null: false
    t.string "company"
    t.string "location"
    t.string "twitter_username"
    t.integer "followers_count", default: 0
    t.integer "following_count", default: 0
    t.string "region"
    t.string "created_at", null: false
    t.string "updated_at", null: false
    t.string "last_issue_cursor"
    t.string "last_pr_cursor"
    t.string "last_follower_cursor"
    t.string "last_following_cursor"
    t.string "last_starred_repo_cursor"
    t.string "last_repo_cursor"
    t.string "last_commit_comment_cursor"
    t.string "last_issue_comment_cursor"
    t.text "bio"
    t.text "story"
  end

  create_table "followers", id: false, charset: "utf8mb4", collation: "utf8mb4_bin", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "target_user_id", null: false
    t.index ["user_id", "target_user_id"], name: "index_followers_on_user_id_and_target_user_id", unique: true
  end

  create_table "followings", id: false, charset: "utf8mb4", collation: "utf8mb4_bin", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "target_user_id", null: false
    t.index ["user_id", "target_user_id"], name: "index_followings_on_user_id_and_target_user_id", unique: true
  end

  create_table "issue_comments", charset: "utf8mb4", collation: "utf8mb4_bin", force: :cascade do |t|
    t.bigint "repo_id"
    t.bigint "user_id"
    t.string "author_association"
    t.bigint "issue_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "issues", charset: "utf8mb4", collation: "utf8mb4_bin", force: :cascade do |t|
    t.bigint "repo_id"
    t.boolean "locked"
    t.string "title"
    t.boolean "closed"
    t.datetime "closed_at"
    t.string "state"
    t.integer "number"
    t.bigint "user_id"
    t.string "author"
    t.string "author_association"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author"], name: "index_issues_on_author"
    t.index ["created_at"], name: "index_issues_on_created_at"
    t.index ["updated_at"], name: "index_issues_on_updated_at"
    t.index ["user_id"], name: "index_issues_on_user_id"
  end

  create_table "pull_requests", charset: "utf8mb4", collation: "utf8mb4_bin", force: :cascade do |t|
    t.bigint "repo_id"
    t.boolean "locked"
    t.string "title"
    t.boolean "closed"
    t.datetime "closed_at"
    t.string "state"
    t.integer "number"
    t.string "author"
    t.bigint "user_id"
    t.string "author_association"
    t.boolean "is_draft"
    t.integer "additions", default: 0
    t.integer "deletions", default: 0
    t.datetime "merged_at"
    t.string "merged_by"
    t.integer "changed_files", default: 0
    t.boolean "merged"
    t.integer "comments_count", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author"], name: "index_pull_requests_on_author"
    t.index ["created_at"], name: "index_pull_requests_on_created_at"
    t.index ["updated_at"], name: "index_pull_requests_on_updated_at"
    t.index ["user_id"], name: "index_pull_requests_on_user_id"
  end

  create_table "repos", charset: "utf8mb4", collation: "utf8mb4_bin", force: :cascade do |t|
    t.string "name"
    t.string "owner"
    t.bigint "user_id"
    t.string "license"
    t.boolean "is_private"
    t.integer "disk_usage"
    t.string "language"
    t.text "description"
    t.boolean "is_fork"
    t.bigint "parent_id"
    t.integer "fork_count"
    t.integer "stargazer_count"
    t.datetime "pushed_at"
    t.json "topics"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_in_organization", default: false
  end

  create_table "starred_repos", id: false, charset: "utf8mb4", collation: "utf8mb4_bin", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "repo_id", null: false
    t.datetime "starred_at", null: false
    t.index ["user_id", "repo_id"], name: "index_starred_repos_on_user_id_and_repo_id", unique: true
  end

  create_table "users", charset: "utf8mb4", collation: "utf8mb4_bin", force: :cascade do |t|
    t.string "login", null: false
    t.string "company"
    t.string "location"
    t.string "twitter_username"
    t.integer "followers_count", default: 0
    t.integer "following_count", default: 0
    t.string "region"
    t.string "created_at", null: false
    t.string "updated_at", null: false
  end

end
