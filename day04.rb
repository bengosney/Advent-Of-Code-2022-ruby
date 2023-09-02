# frozen_string_literal: true

require 'rspec/autorun'
require 'set'

# Solver for Day 4
class Day4
  def expand(pair)
    from, to = pair.split('-').map(&:to_i)
    (from..to).to_a
  end

  def contains(one, two)
    one.all? { |i| two.include?(i) } || two.all? { |i| one.include?(i) } ? 1 : 0
  end

  def overlaps(one, two)
    one.any? { |i| two.include? i } ? 1 : 0
  end

  def part1(input)
    input.split("\n").map do |pair|
      one, two = pair.split(',').map { |range| expand(range) }
      contains(one, two)
    end
         .sum
  end

  def part2(input)
    input.split("\n").map do |pair|
      one, two = pair.split(',').map { |range| expand(range) }
      overlaps(one, two)
    end
         .sum
  end
end

def example_input
  "2-4,6-8
  2-3,4-5
  5-7,7-9
  2-8,3-7
  6-6,4-6
  2-6,4-8"
end

describe Day4 do
  it 'Expand' do
    solver = Day4.new
    expect(solver.expand('3-6')).to eq([3, 4, 5, 6])
  end

  it 'Part 1' do
    solver = Day4.new
    expect(solver.part1(example_input)).to eq(2)
  end

  it 'Part 2' do
    solver = Day4.new
    expect(solver.part2(example_input)).to eq(4)
  end
end

if __FILE__ == $PROGRAM_NAME
  solver = Day4.new
  part1 = solver.part1 example_input
  puts "Part 1: #{part1}"

  part2 = solver.part2 example_input
  puts "Part 2: #{part2}"
end
