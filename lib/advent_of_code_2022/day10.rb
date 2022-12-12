# frozen_string_literal: true

module AdventOfCode2022
  class Day10
    def part1
      instructions = raw_data.split("\n")
      instruction_number = 0
      cycle = 0
      x = 1
      interesting_signal_strenghts = []
      wait = true
      next_interesting_cycle = 20
      keep_cycling = true

      while keep_cycling
        if instruction_number == instructions.size
          keep_cycling = false
          break
        end

        cycle += 1

        if cycle == next_interesting_cycle
          interesting_signal_strenghts.push(x * cycle)
          next_interesting_cycle += 40
        end

        instruction = instructions[instruction_number]

        case instruction
        when /addx (-?\d+)/
          if wait
            wait = false
          else
            x += $1.to_i
            instruction_number += 1
            wait = true
          end
        else
          instruction_number += 1
        end
      end

      interesting_signal_strenghts.sum
    end

    def part2
      instructions = raw_data.split("\n")
      instruction_number = 0
      cycle = 0
      x = 1
      wait = true
      crt = []

      240.times do
        cycle += 1

        crt << if [cycle - 1, cycle, cycle + 1].map { |n| n % 40 }.include?(x + 1)
          "#"
        else
          " "
        end

        instruction = instructions[instruction_number]

        case instruction
        when /addx (-?\d+)/
          if wait
            wait = false
          else
            x += $1.to_i
            instruction_number += 1
            wait = true
          end
        else
          instruction_number += 1
        end
      end
    end

    private

    def raw_data
      File.read(
        File.join(File.dirname(__FILE__), "inputs", "day10", "entries.txt")
      )
    end
  end
end
