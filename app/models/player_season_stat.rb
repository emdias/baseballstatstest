class PlayerSeasonStat < ActiveRecord::Base
  belongs_to :player

  before_save :calculate_stats

  def player_name
    "#{player.surname}, #{player.given_name}"
  end


  def calculate_stats
    unless at_bats.blank? || at_bats < 0
      # Batting Average
      self.avg = (hits.to_f / at_bats.to_f).round(3)

      # On-base Plus Slugging
      tb = (hits + (doubles * 2) + (triples * 3) + (hr * 4)).to_f
      slg = tb/at_bats.to_f

      num = (hits + walks + hit_by_pitch).to_f
      den = (at_bats + walks + sacrifice_flies + hit_by_pitch).to_f
      obp = num / den

      self.ops = (obp + slg).round(4)
    end
  end
end