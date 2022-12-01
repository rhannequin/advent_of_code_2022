# frozen_string_literal: true

module AdventOfCode2022
  class Day1
    def part1 # 74198
      sums_of_calories.max
    end

    def part2 # 209914
      sums_of_calories
        .sort
        .last(3)
        .sum
    end

    private

    def raw_data
      File.read(
        File.join(File.dirname(__FILE__), "inputs", "day1", "entries.txt")
      )
    end

    def sums_of_calories
      raw_data
        .split("\n\n")
        .map { |calories| calories.split.map(&:to_i).sum }
    end
  end
end
