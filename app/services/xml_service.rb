class XmlService
  require 'nokogiri'
  require 'open-uri'

  # Services designed to be used to interact with XML files.

  # Upload a file from a website
  def self.upload_xml(xml_file)
    begin
      doc = Nokogiri.XML(open(xml_file))
    rescue => e
      return 'Error loading site'
    end

    parse_xml(doc)
  end

  # Upload from a local source
  def self.read_xml(xml_file)
    begin
      doc = File.open(xml_file) {|f| Nokogiri.XML(open(f)) }
    rescue => e
      return 'Error loading file'
    end

    parse_xml(doc)
  end


  def self.parse_xml(xml_data)
    seasons = []
    puts seasons
    xml_data.css('SEASON').each do |season|
      year = value(season, 'YEAR')

      season.css('LEAGUE').each do |league|
        league_name = value(league, 'LEAGUE_NAME')

        league.css('DIVISION').each do |division|
          division_name = value(division, 'DIVISION_NAME')

          division.css('TEAM').each do |team|
            team_city = value(team, 'TEAM_CITY')
            team_name = value(team, 'TEAM_NAME')

            team.css('PLAYER').each do |player|
              at_bats = value(player, 'AT_BATS')
              next if at_bats.blank?
              p = Player.find_or_create_by(surname: value(player, 'SURNAME'),
                                           given_name: value(player, 'GIVEN_NAME'))

              pss = PlayerSeasonStat.find_or_create_by(player_id: p.id,
                                                       year: year,
                                                       league: league_name,
                                                       division: division_name,
                                                       team_city: team_city,
                                                       team_name: team_name)

              pss.position        = value(player, 'POSITION')
              pss.hr              = value(player, 'HOME_RUNS')
              pss.rbi             = value(player, 'RBI')
              pss.runs            = value(player, 'RUNS')
              pss.sb              = value(player, 'STEALS')
              pss.games           = value(player, 'GAMES')
              pss.games_started   = value(player, 'GAMES_STARTED')
              pss.at_bats         = at_bats
              pss.hits            = value(player, 'HITS')
              pss.doubles         = value(player, 'DOUBLES')
              pss.triples         = value(player, 'TRIPLES')
              pss.caught_stealing = value(player, 'CAUGHT_STEALING')
              pss.sacrifice_hits  = value(player, 'SACRIFICE_HITS')
              pss.sacrifice_flies = value(player, 'SACRIFICE_FLIES')
              pss.errors_stat     = value(player, 'ERRORS')
              pss.pb              = value(player, 'PB')
              pss.walks           = value(player, 'WALKS')
              pss.struck_out      = value(player, 'STRUCK_OUT')
              pss.hit_by_pitch    = value(player, 'HIT_BY_PITCH')
              pss.save
            end
          end

        end
      end
    end
  end

 private
  def self.value(obj, field)
    obj.css(field).inner_text || 0
  rescue
    0
  end
end