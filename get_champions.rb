# { name: "Alice", age: 25, elo: 2100 }
# { name: "Bob", age: 30, elo: 2300 }
# { name: "Charlie", age: 20, elo: 2000 }
# { name: "David", age: 25, elo: 2250 }
# { name: "Emily", age: 28, elo: 2250 }
# { name: "Frank", age: 18, elo: 1950 }
# { name: "George", age: 25, elo: 2100 }
# { name: "Hannah", age: 20, elo: 2000 }
# { name: "Isaac", age: 30, elo: 2300 }
# { name: "Julia", age: 25, elo: 2200 }
# { name: "Kate", age: 28, elo: 2250 }
# { name: "Liam", age: 18, elo: 1950 }

# compare each player with the ones that come before them in the sorted list
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
