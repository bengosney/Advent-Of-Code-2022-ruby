# frozen_string_literal: true

require 'rspec/autorun'
require 'set'

PRIORITIES = Hash[
  ('a'..'z').map.with_index(1) { |char, i| [char, i] } +
  ('A'..'Z').map.with_index(27) { |char, i| [char, i] }
].freeze

# Solver for Day 3
class Day3
  def split_string(str)
    [str[0, str.size / 2], str[str.size / 2..]]
  end

  def part1(input)
    input.split("\n").map do |bag|
      left, right = split_string(bag).map { |side| side.split('').to_set }
      (left & right).map do |item|
        PRIORITIES[item]
      end
                    .sum
    end
         .sum
  end

  def part2(input)
    input.split("\n").each_slice(3).to_a.map do |group|
      a, b, c = group.map { |bag| bag.split('').to_set }
      (a & b & c).map do |item|
        PRIORITIES[item]
      end
                 .sum
    end
         .sum
  end
end

def example_input
  "vJrwpWtwJgWrhcsFMMfFFhFp
jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL
PmmdzqPrVvPwwTWBwg
wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn
ttgJtRGJQctTZtZT
CrZsJsPPZsGzwwsLwLmpwMDw"
end

describe Day3 do
  it 'Part 1' do
    solver = Day3.new
    expect(solver.part1(example_input)).to eq(157)
  end

  it 'Part 2' do
    solver = Day3.new
    expect(solver.part2(example_input)).to eq(70)
  end
end

if __FILE__ == $PROGRAM_NAME
  solver = Day3.new
  part1 = solver.part1 example_input
  puts "Part 1: #{part1}"

  part2 = solver.part2 example_input
  puts "Part 2: #{part2}"
end
