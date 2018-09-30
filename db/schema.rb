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

ActiveRecord::Schema.define(version: 2018_09_29_141922) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "competition_periods", force: :cascade do |t|
    t.bigint "competition_id"
    t.bigint "period_id"
    t.index ["competition_id"], name: "index_competition_periods_on_competition_id"
    t.index ["period_id"], name: "index_competition_periods_on_period_id"
  end

  create_table "competitions", force: :cascade do |t|
    t.string "uuid"
    t.string "name"
    t.string "slug"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_competitions_on_slug"
    t.index ["uuid"], name: "index_competitions_on_uuid"
  end

  create_table "games", force: :cascade do |t|
    t.bigint "league_id"
    t.integer "local_team_id"
    t.integer "away_team_id"
    t.integer "local_score"
    t.integer "away_score"
    t.integer "status", default: 0
    t.datetime "event_date"
    t.integer "round"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["away_team_id"], name: "index_games_on_away_team_id"
    t.index ["league_id"], name: "index_games_on_league_id"
    t.index ["local_team_id"], name: "index_games_on_local_team_id"
    t.index ["status"], name: "index_games_on_status"
  end

  create_table "gateways", force: :cascade do |t|
    t.string "gateway_id"
    t.bigint "provider_id"
    t.string "syncable_type"
    t.bigint "syncable_id"
    t.integer "status", default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["provider_id"], name: "index_gateways_on_provider_id"
    t.index ["syncable_id", "syncable_type"], name: "index_gateways_on_syncable_id_and_syncable_type"
    t.index ["syncable_type", "syncable_id"], name: "index_gateways_on_syncable_type_and_syncable_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string "uuid"
    t.string "name"
    t.string "slug"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_groups_on_slug"
    t.index ["uuid"], name: "index_groups_on_uuid"
  end

  create_table "league_participations", force: :cascade do |t|
    t.bigint "league_id"
    t.bigint "team_id"
    t.bigint "period_id"
    t.index ["league_id"], name: "index_league_participations_on_league_id"
    t.index ["period_id"], name: "index_league_participations_on_period_id"
    t.index ["team_id"], name: "index_league_participations_on_team_id"
  end

  create_table "leagues", force: :cascade do |t|
    t.string "uuid"
    t.string "name"
    t.string "slug"
    t.string "sport"
    t.string "country_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_code"], name: "index_leagues_on_country_code"
    t.index ["slug"], name: "index_leagues_on_slug"
    t.index ["sport"], name: "index_leagues_on_sport"
    t.index ["uuid"], name: "index_leagues_on_uuid"
  end

  create_table "periods", force: :cascade do |t|
    t.string "uuid"
    t.string "name"
    t.string "slug"
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_periods_on_slug"
    t.index ["uuid"], name: "index_periods_on_uuid"
  end

  create_table "providers", force: :cascade do |t|
    t.string "uuid"
    t.string "name"
    t.json "credentials"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["uuid"], name: "index_providers_on_uuid"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.bigint "resource_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource_type_and_resource_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "uuid"
    t.string "name"
    t.string "slug"
    t.string "sport"
    t.date "founded"
    t.string "country_code"
    t.string "coach_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_code"], name: "index_teams_on_country_code"
    t.index ["slug"], name: "index_teams_on_slug"
    t.index ["sport"], name: "index_teams_on_sport"
    t.index ["uuid"], name: "index_teams_on_uuid"
  end

  create_table "users", force: :cascade do |t|
    t.string "uuid"
    t.string "name"
    t.string "slug"
    t.string "email"
    t.string "password_digest"
    t.text "biography"
    t.string "city"
    t.string "job"
    t.string "preferred_sport"
    t.string "preferred_team"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_users_on_slug"
    t.index ["uuid"], name: "index_users_on_uuid"
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "role_id"
    t.index ["role_id"], name: "index_users_roles_on_role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"
    t.index ["user_id"], name: "index_users_roles_on_user_id"
  end

end
