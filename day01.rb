# frozen_string_literal: true

require 'rspec/autorun'

# Solver for Day 1
class Day1
  def calorie_list(input)
    elves = input.split("\n\n")
                 .map do |cals|
      cals
        .split("\n")
        .map(&:to_i)
        .sum
    end

    elves.sort.reverse
  end

  def part1(input)
    calorie_list(input)[0]
  end

  def part2(input)
    calorie_list(input).slice(0, 3).sum
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

describe Day1 do
  it 'Part 1: finds the most calories' do
    solver = Day1.new
    expect(solver.part1(example_input)).to eq(24_000)
  end

  it 'Part 2: finds the sum of the top 3 calorie holders' do
    solver = Day1.new
    expect(solver.part2(example_input)).to eq(45_000)
  end
end

if __FILE__ == $PROGRAM_NAME
  day1 = Day1.new
  part1 = day1.part1 example_input
  puts "Part 1: #{part1}"

  part2 = day1.part2 example_input
  puts "Part 2: #{part2}"
end
