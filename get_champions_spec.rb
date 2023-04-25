require 'rspec'
require_relative 'get_champions'

RSpec.describe "#get_champions" do
  context "when there are no players" do
    let(:players) { [] }
    it { expect(get_champions(players)).to eq(players) }
  end

  context "when there is only one player in the list" do
    let(:players) {
      [
          { name: "Alice", age: 25, elo: 2100 }
      ]
    }

    it { expect(get_champions(players)).to eq(players) }
  end

  context "regular case with some champions" do
    let(:players) {
      [
          { name: "Alice", age: 23, elo: 1500 },
          { name: "Bob", age: 21, elo: 1800 },
          { name: "Charlie", age: 25, elo: 1700 },
          { name: "David", age: 20, elo: 1600 },
          { name: "Emily", age: 22, elo: 1400 },
      ]
    }

    let(:expected_champions) {
      [
          { name: "Bob", age: 21, elo: 1800 },
          { name: "David", age: 20, elo: 1600 },
      ]
    }

    it { expect(get_champions(players)).to eq(expected_champions) }
  end

  context "when all players meet the criteria" do
    let(:players) {
      [
          { name: "Alice", age: 21, elo: 2100 },
          { name: "Bob", age: 22, elo: 2200 },
          { name: "Charlie", age: 23, elo: 2300 },
          { name: "David", age: 24, elo: 2400 },
          { name: "Emily", age: 25, elo: 2500 }
      ]
    }

    it { expect(get_champions(players)).to eq(players) }
  end

  context "case with multiple players with the same age and score" do
    let(:players) {
      [
          { name: "Alice", age: 25, elo: 2100 },
          { name: "Bob", age: 30, elo: 2300 },
          { name: "Charlie", age: 20, elo: 2000 },
          { name: "David", age: 25, elo: 2250 },
          { name: "Emily", age: 28, elo: 2250 },
          { name: "Frank", age: 18, elo: 1950 },
          { name: "George", age: 25, elo: 2100 },
          { name: "Hannah", age: 20, elo: 2000 },
          { name: "Isaac", age: 30, elo: 2300 },
          { name: "Julia", age: 25, elo: 2200 },
          { name: "Kate", age: 28, elo: 2250 },
          { name: "Liam", age: 18, elo: 1950 }
      ]
    }

    let(:expected_champions) {
      [
          { name: "Bob", age: 30, elo: 2300 },
          { name: "Charlie", age: 20, elo: 2000 },
          { name: "David", age: 25, elo: 2250 },
          { name: "Frank", age: 18, elo: 1950 },
          { name: "Hannah", age: 20, elo: 2000 },
          { name: "Isaac", age: 30, elo: 2300 },
          { name: "Liam", age: 18, elo: 1950 }
      ]
    }

    it { expect(get_champions(players)).to match_array(expected_champions) }
  end
end
