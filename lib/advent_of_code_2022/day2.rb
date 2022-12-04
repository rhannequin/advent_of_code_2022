# frozen_string_literal: true

module AdventOfCode2022
  class Day2
    TOOL_WEIGHT = {
      "A" => 1,
      "B" => 2,
      "C" => 3,
      "X" => 1,
      "Y" => 2,
      "Z" => 3
    }.freeze

    TOOL_BASED_OUTCOMES = {
      "A" => {
        "X" => 3,
        "Y" => 6,
        "Z" => 0
      },
      "B" => {
        "X" => 0,
        "Y" => 3,
        "Z" => 6
      },
      "C" => {
        "X" => 6,
        "Y" => 0,
        "Z" => 3
      }
    }.freeze

    EXPECTED_RESULT_WEIGHT = {
      "X" => 0,
      "Y" => 3,
      "Z" => 6
    }

    RESULT_BASED_OUTCOMES = {
      "A" => {
        0 => "C",
        3 => "A",
        6 => "B"
      },
      "B" => {
        0 => "A",
        3 => "B",
        6 => "C"
      },
      "C" => {
        0 => "B",
        3 => "C",
        6 => "A"
      }
    }.freeze

    def part1
      raw_data
        .split("\n")
        .map do |round|
          opponent, yourself = round.split
          TOOL_BASED_OUTCOMES.dig(opponent, yourself) +
            TOOL_WEIGHT.fetch(yourself)
        end.sum
    end

    def part2
      raw_data
        .split("\n")
        .map do |round|
          opponent, expected_game_result = round.split
          result = EXPECTED_RESULT_WEIGHT.fetch(expected_game_result)
          TOOL_WEIGHT.fetch(RESULT_BASED_OUTCOMES.dig(opponent, result)) +
            result
        end.sum
    end

    private

    def raw_data
      File.read(
        File.join(File.dirname(__FILE__), "inputs", "day2", "entries.txt")
      )
    end
  end
end
