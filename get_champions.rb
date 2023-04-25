def get_champions(players = [])
  return players if players.empty?

  champions = []

  # Sort players by decreasing elo and then ascending age
  players.sort_by! { |player| [-player[:elo], player[:age]] }
  max_age = players.first[:age]

  players.each do |player|
    if player[:age] <= max_age && champions.none? { |champion| champion[:elo] > player[:elo] && champion[:age] <= player[:age] }
      champions << player

      # keep track of the maximum champion age seen so far
      max_age = player[:age]
    end
  end

  champions
end
