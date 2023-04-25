# you have a list of chess players with their ages and scores (elo).
# you have to extract from the list the "champions
# a player is called "champion" if and only if there is nobody else in the list who "eliminates" him, that is to say
#  - nobody else is both strictly stronger and younger or the same age
# and
#  - no one else is both strictly younger and stronger or the same score

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

def get_champions(players = [])
  players.select do |player|
    # Check if player is champion
    players.none? { |opponent| opponent != player && (opponent[:age] <= player[:age] && opponent[:elo] > player[:elo] || opponent[:age] < player[:age] && opponent[:elo] >= player[:elo]) }
  end
end