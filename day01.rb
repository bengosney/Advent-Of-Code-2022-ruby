require 'rspec/autorun'

class Day1
    def get_calorie_list(input)
        elves = input.split("\n\n")
            .map { | cals | cals
                .split("\n")
                .map(&:to_i)
                .sum()
            }

        return elves.sort.reverse
    end

    def part_1(input)
        return self.get_calorie_list(input)[0]
    end

    def part_2(input)
        return self.get_calorie_list(input).slice(0,3).sum()
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


describe Day1 do
    it "Part 1: finds the most calories" do
        solver = Day1.new
        expect(solver.part_1 get_example_input).to eq(24000)
    end

    it "Part 2: finds the sum of the top 3 calorie holders" do
        solver = Day1.new
        expect(solver.part_2 get_example_input).to eq(45000)
    end
end


if __FILE__ == $0
    day1 = Day1.new
    part1 = day1.part_1 get_example_input
    puts "Part 1: #{part1}"

    part2 = day1.part_2 get_example_input
    puts "Part 2: #{part2}"
end
