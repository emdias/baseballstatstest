class CreatePlayerSeasonStats < ActiveRecord::Migration
  def change
    create_table :player_season_stats do |t|
      t.string :player_id
      t.string :league
      t.string :division
      t.string :year
      t.string :team_city
      t.string :team_name
      t.string :position

      t.float   :avg,  default: 0.0       # Batting Average
      t.integer :hr,   default: 0       # Home Runs
      t.integer :rbi,  default: 0       # Runs Batted In
      t.integer :runs, default: 0       # Runs Scored
      t.integer :sb,   default: 0       # Stolen Bases
      t.float   :ops,  default: 0.0       # On-base Plus Slugging

      # Batting Stats
      t.integer :games,           default: 0
      t.integer :games_started,   default: 0
      t.integer :at_bats,         default: 0
      t.integer :hits,            default: 0
      t.integer :doubles,         default: 0
      t.integer :triples,         default: 0
      t.integer :caught_stealing, default: 0
      t.integer :sacrifice_hits,  default: 0
      t.integer :sacrifice_flies, default: 0
      t.integer :errors_stat,     default: 0
      t.integer :pb,              default: 0
      t.integer :walks,           default: 0
      t.integer :struck_out,      default: 0
      t.integer :hit_by_pitch,    default: 0
    end
  end
end
