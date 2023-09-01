# frozen_string_literal: true

require 'rspec/autorun'

ROCK = 1
PAPAER = 2
SCISSORS = 3

LOOSE = 0
DRAW = 3
WIN = 6

# Solver for Day 2
class Day2
  def score_game(game)
    case game
    in [ROCK, PAPAER] | [PAPAER, SCISSORS] | [SCISSORS, ROCK]
      WIN
    in [ROCK, ROCK] | [PAPAER, PAPAER] | [SCISSORS, SCISSORS]
      DRAW
    in [PAPAER, ROCK] | [SCISSORS, PAPAER] | [ROCK, SCISSORS]
      LOOSE
    end
  end

  def score_move(move)
    case move
    in 'A' | 'X'
      ROCK
    in 'B' | 'Y'
      PAPAER
    in 'C' | 'Z'
      SCISSORS
    end
  end

  def part1(input)
    input.split("\n").map do |game|
      moves = game.split(' ').map do |move|
        score_move(move)
      end
      score_game(moves) + moves[1]
    end
         .sum
  end

  def part2(_input)
    nil
  end
end

def example_input
  "A Y
B X
C Z"
end

describe Day2 do
  it 'Part 1: get the score of the strat' do
    solver = Day2.new
    expect(solver.part1(example_input)).to eq(15)
  end

  it 'Part 2' do
    solver = Day2.new
    expect(solver.part2(example_input)).to eq(12)
  end

  it 'Score a win' do
    solver = Day2.new
    expect(solver.score_game([ROCK, PAPAER])).to eq(6)
  end

  it 'Score a draw' do
    solver = Day2.new
    expect(solver.score_game([PAPAER, PAPAER])).to eq(3)
  end

  it 'Score a loss' do
    solver = Day2.new
    expect(solver.score_game([SCISSORS, PAPAER])).to eq(0)
  end

  it 'Move to ROCK' do
    solver = Day2.new
    expect(solver.score_move('A')).to eq(ROCK)
    expect(solver.score_move('X')).to eq(ROCK)
  end

  it 'Move to PAPER' do
    solver = Day2.new
    expect(solver.score_move('B')).to eq(PAPAER)
    expect(solver.score_move('Y')).to eq(PAPAER)
  end

  it 'Move to SCISSORS' do
    solver = Day2.new
    expect(solver.score_move('C')).to eq(SCISSORS)
    expect(solver.score_move('Z')).to eq(SCISSORS)
  end
end

if __FILE__ == $PROGRAM_NAME
  day2 = Day2.new
  part1 = day2.part1 example_input
  puts "Part 1: #{part1}"

  part2 = day2.part2 example_input
  puts "Part 2: #{part2}"
end
