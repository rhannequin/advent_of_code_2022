# frozen_string_literal: true

require "set"

module AdventOfCode2022
  class Day9
    def part1
      last_knot_positions(2)
    end

    def part2
      last_knot_positions(10)
    end

    private

    def raw_data
      File.read(
        File.join(File.dirname(__FILE__), "inputs", "day9", "entries.txt")
      )
    end

    def last_knot_positions(number_of_knots)
      visited_positions = Set[[0, 0]]
      rope = (0..number_of_knots - 1).map { |knot| [0, 0] }

      raw_data.split("\n").each do |motion|
        direction, distance = motion.split

        distance.to_i.times do
          rope[0] = new_position(direction, rope[0])

          (1..number_of_knots - 1).each do |knot|
            distance_x = (rope[knot - 1].first - rope[knot].first)
            distance_y = (rope[knot - 1].last - rope[knot].last)

            if distance_x.abs >= 2 || distance_y.abs >= 2
              rope[knot] = [
                rope[knot].first + distance_x.clamp(-1, 1),
                rope[knot].last + distance_y.clamp(-1, 1)
              ]
            end
          end

          visited_positions.add(rope.last)
        end
      end

      visited_positions.count
    end

    def new_position(direction, current_position)
      case direction
      when "L"
        [current_position.first - 1, current_position.last]
      when "R"
        [current_position.first + 1, current_position.last]
      when "U"
        [current_position.first, current_position.last + 1]
      when "D"
        [current_position.first, current_position.last - 1]
      end
    end
  end
end
