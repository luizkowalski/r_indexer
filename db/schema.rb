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

ActiveRecord::Schema.define(version: 20171130204503) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authors", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.index ["email"], name: "index_authors_on_email"
  end

  create_table "authors_maintainers", force: :cascade do |t|
    t.bigint "package_id"
    t.bigint "maintainer_id"
    t.index ["maintainer_id"], name: "index_authors_maintainers_on_maintainer_id"
    t.index ["package_id", "maintainer_id"], name: "index_authors_maintainers_on_package_id_and_maintainer_id", unique: true
    t.index ["package_id"], name: "index_authors_maintainers_on_package_id"
  end

  create_table "authors_packages", force: :cascade do |t|
    t.bigint "package_id"
    t.bigint "author_id"
    t.index ["author_id"], name: "index_authors_packages_on_author_id"
    t.index ["package_id", "author_id"], name: "index_authors_packages_on_package_id_and_author_id", unique: true
    t.index ["package_id"], name: "index_authors_packages_on_package_id"
  end

  create_table "maintainers", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.index ["email"], name: "index_maintainers_on_email"
  end

  create_table "packages", force: :cascade do |t|
    t.string "name", null: false
    t.string "title"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_packages_on_name"
    t.index ["title"], name: "index_packages_on_title"
  end

  create_table "versions", force: :cascade do |t|
    t.bigint "package_id"
    t.string "version", null: false
    t.date "published_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["package_id"], name: "index_versions_on_package_id"
    t.index ["version"], name: "index_versions_on_version"
  end

  add_foreign_key "versions", "packages"
end
