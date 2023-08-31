# frozen_string_literal: true

require 'rspec/autorun'

# Solver for Day 2
class Day2
  def part1(_input)
    nil
  end

  def part2(_input)
    nil
  end
end

def example_input
  "1000
2000
3000

4000

5000
6000

7000
8000
9000

10000"
end

describe Day2 do
  it 'Part 1: finds the most calories' do
    solver = Day2.new
    expect(solver.part1(example_input)).to eq(24_000)
  end

  it 'Part 2: finds the sum of the top 3 calorie holders' do
    solver = Day2.new
    expect(solver.part2(example_input)).to eq(45_000)
  end
end

if __FILE__ == $PROGRAM_NAME
  Day2 = Day2.new
  part1 = Day2.part1 example_input
  puts "Part 1: #{part1}"

  part2 = Day2.part2 example_input
  puts "Part 2: #{part2}"
end
