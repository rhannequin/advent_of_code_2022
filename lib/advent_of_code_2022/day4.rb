# frozen_string_literal: true

module AdventOfCode2022
  class Day4
    def part1
      raw_data
        .split
        .count do |assignment_pair|
          first_pair, second_pair = assignment_pair
            .split(",")
            .map do |assignment|
              starting_section, ending_section = assignment.split("-")
              (starting_section..ending_section).to_a
            end

          (first_pair - second_pair).empty? || (second_pair - first_pair).empty?
        end
    end

    def part2
      raw_data
        .split
        .count do |assignment_pair|
          first_pair, second_pair = assignment_pair
            .split(",")
            .map do |assignment|
              starting_section, ending_section = assignment.split("-")
              (starting_section..ending_section).to_a
            end

          (first_pair & second_pair).any?
        end
    end

    private

    def raw_data
      File.read(
        File.join(File.dirname(__FILE__), "inputs", "day4", "entries.txt")
      )
    end
  end
end
