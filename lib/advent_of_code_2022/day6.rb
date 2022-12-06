# frozen_string_literal: true

module AdventOfCode2022
  class Day6
    START_OF_PACKET_MARKER_SIZE = 4
    START_OF_MESSAGE_MARKER_SIZE = 14

    def part1
      chars = raw_data.strip.chars
      (START_OF_PACKET_MARKER_SIZE..chars.size).find do |char_position|
        chars[
          (char_position - START_OF_PACKET_MARKER_SIZE)...char_position
        ].uniq.size == START_OF_PACKET_MARKER_SIZE
      end
    end

    def part2
      chars = raw_data.strip.chars
      (START_OF_MESSAGE_MARKER_SIZE..chars.size).find do |char_position|
        chars[
          (char_position - START_OF_MESSAGE_MARKER_SIZE)...char_position
        ].uniq.size == START_OF_MESSAGE_MARKER_SIZE
      end
    end

    private

    def raw_data
      File.read(
        File.join(File.dirname(__FILE__), "inputs", "day6", "entries.txt")
      )
    end
  end
end
