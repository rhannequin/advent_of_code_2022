# frozen_string_literal: true

module AdventOfCode2022
  class Day5
    def initialize
      @raws = raw_data.split("\n")
    end

    def part1
      stacks = initial_stacks
      procedures_raws.each do |procedure|
        quantity, origin, destination = procedure.scan(/\d+/).map(&:to_i)
        stacks[destination - 1].unshift(*stacks[origin - 1].shift(quantity).reverse)
      end

      stacks.map(&:first).join
    end

    def part2
      stacks = initial_stacks
      procedures_raws.each do |procedure|
        quantity, origin, destination = procedure.scan(/\d+/).map(&:to_i)
        stacks[destination - 1].unshift(*stacks[origin - 1].shift(quantity))
      end

      stacks.map(&:first).join
    end

    private

    def raw_data
      File.read(
        File.join(File.dirname(__FILE__), "inputs", "day5", "entries.txt")
      )
    end

    def raw_number_of_stack_numbers
      @raws
        .each_index
        .find { |index| @raws[index].strip[0].match?(/\d/) }
    end

    def stack_raws
      @raws[0...raw_number_of_stack_numbers]
    end

    def procedures_raws
      @raws[(raw_number_of_stack_numbers + 2)..]
    end

    def number_of_stacks
      @raws[raw_number_of_stack_numbers].strip.split.count
    end

    def stack_numbers_with_positions
      numbers_with_positions = {}
      @raws[raw_number_of_stack_numbers]
        .chars
        .each_with_index do |char, index|
          if char.match?(/[[:digit:]]/)
            numbers_with_positions[char.to_i] = index
          end
        end
      numbers_with_positions
    end

    def initial_stacks
      stacks = []
      stack_raws.each do |stack_raw|
        (1..number_of_stacks).each do |stack_number|
          crate = stack_raw[stack_numbers_with_positions[stack_number]].strip

          unless crate.strip.empty?
            stacks[stack_number - 1] ||= []
            stacks[stack_number - 1] << crate
          end
        end
      end
      stacks
    end
  end
end
