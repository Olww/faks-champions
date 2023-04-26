def get_champions(players = [])
  return [] if players.empty?

  champions = []
  sorted_players = players.sort_by { |player| [-player[:elo], player[:age]] }
  max_age = sorted_players.first[:age]
  max_elo = sorted_players.first[:elo]

  sorted_players.each do |player|
    if player[:age] < max_age || (player[:age] == max_age && player[:elo] >= max_elo)
      max_age = player[:age]
      max_elo = player[:elo]

      champions << player
    end
  end

  champions
end
