# frozen_string_literal: true

module AdventOfCode2022
  class Day3
    ELVES_BY_GROUP = 3

    def part1 # 8349
      raw_data
        .split
        .map do |rucksack|
        priority.fetch(
          [
            rucksack[0, rucksack.size / 2],
            rucksack[rucksack.size / 2..]
          ].map(&:chars).inject(:&).first
        )
      end.sum
    end

    def part2 # 2681
      raw_data
        .split
        .each_slice(ELVES_BY_GROUP)
        .map { |groups| priority.fetch groups.map(&:chars).inject(:&).first }
        .sum
    end

    private

    def raw_data
      File.read(
        File.join(File.dirname(__FILE__), "inputs", "day3", "entries.txt")
      )
    end

    def priority
      @priority ||= (("a".."z").to_a + ("A".."Z").to_a)
        .map
        .with_index { |item_type, i| [item_type, i + 1] }
        .to_h
    end
  end
end
