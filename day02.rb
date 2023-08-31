require 'rspec/autorun'

class Day2
    def part_1(input)
        return nil
    end

    def part_2(input)
        return nil
    end
end


def get_example_input
    return "1000
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
    it "Part 1: finds the most calories" do
        solver = Day2.new
        expect(solver.part_1 get_example_input).to eq(24000)
    end

    it "Part 2: finds the sum of the top 3 calorie holders" do
        solver = Day2.new
        expect(solver.part_2 get_example_input).to eq(45000)
    end
end


if __FILE__ == $0
    Day2 = Day2.new
    part1 = Day2.part_1 get_example_input
    puts "Part 1: #{part1}"

    part2 = Day2.part_2 get_example_input
    puts "Part 2: #{part2}"
end
