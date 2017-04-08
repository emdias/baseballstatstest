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

ActiveRecord::Schema.define(version: 20170408150800) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "player_season_stats", force: :cascade do |t|
    t.integer "player_id"
    t.string  "league"
    t.string  "division"
    t.string  "year"
    t.string  "team_city"
    t.string  "team_name"
    t.string  "position"
    t.float   "avg",             default: 0.0
    t.integer "hr",              default: 0
    t.integer "rbi",             default: 0
    t.integer "runs",            default: 0
    t.integer "sb",              default: 0
    t.float   "ops",             default: 0.0
    t.integer "games",           default: 0
    t.integer "games_started",   default: 0
    t.integer "at_bats",         default: 0
    t.integer "hits",            default: 0
    t.integer "doubles",         default: 0
    t.integer "triples",         default: 0
    t.integer "caught_stealing", default: 0
    t.integer "sacrifice_hits",  default: 0
    t.integer "sacrifice_flies", default: 0
    t.integer "errors_stat",     default: 0
    t.integer "pb",              default: 0
    t.integer "walks",           default: 0
    t.integer "struck_out",      default: 0
    t.integer "hit_by_pitch",    default: 0
  end

  create_table "players", force: :cascade do |t|
    t.string "surname"
    t.string "given_name"
  end

end
