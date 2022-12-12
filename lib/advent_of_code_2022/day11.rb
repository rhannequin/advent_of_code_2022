# frozen_string_literal: true

module AdventOfCode2022
  class Day11
    Monkey = Struct.new(:id, :operation, :term, :divisible, :next_true, :next_false)

    def part1
      compute(20, div: true)
    end

    def part2
      compute(10_000)
    end

    private

    def raw_data
      File.read(
        File.join(File.dirname(__FILE__), "inputs", "day11", "entries.txt")
      )
    end

    def monkey_attributes(game)
      attributes = game.split("\n")
      id = attributes[0].scan(/\d+/).first.to_i
      operation, term = attributes[2].scan(/(\+|\*)\s+(\d+|old)/).first
      divisible = attributes[3].scan(/\d+/).first.to_i
      next_true = attributes[4].scan(/\d+/).first.to_i
      next_false = attributes[5].scan(/\d+/).first.to_i

      Monkey.new(id, operation, term, divisible, next_true, next_false)
    end

    def compute(rounds, div: false)
      divisors = []
      games = raw_data.split("\n\n")
      monkey_inspections = Array.new(games.size, 0)

      monkey_objects = games.each_with_object({}) do |game, hash|
        attributes = game.split("\n")
        monkey = attributes[0].scan(/\d+/).first.to_i
        hash[monkey] = attributes[1].scan(/\d+/).map(&:to_i)
        divisors << attributes[3].scan(/\d+/).first.to_i
      end

      rounds.times do
        games.each do |game|
          monkey = monkey_attributes(game)

          monkey_objects[monkey.id].each do |level|
            term = monkey.term.eql?("old") ? level : monkey.term.to_i
            level = level.public_send(monkey.operation, term % divisors.inject(:*))
            level /= 3 if div
            next_monkey = (level % monkey.divisible).zero? ? monkey.next_true : monkey.next_false

            monkey_inspections[monkey.id] += 1
            monkey_objects[next_monkey].push(level)
            monkey_objects[monkey.id] = []
          end
        end
      end

      monkey_inspections.max(2).inject(:*)
    end
  end
end
