# frozen_string_literal: true

module AdventOfCode2022
  class Day8
    def part1
      transposed_grid = grid.transpose
      visible_trees = grid.size * 4 - 4

      (1...grid.size - 1).each do |y|
        (1...grid.size - 1).each do |x|
          tree_size = grid[x][y]
          if [
            grid[x][0..y - 1].all? { |t| t < tree_size },
            grid[x][y + 1..].all? { |t| t < tree_size },
            transposed_grid[y][0..x - 1].all? { |t| t < tree_size },
            transposed_grid[y][x + 1..].all? { |t| t < tree_size }
          ].any?(true)
            visible_trees += 1
          end
        end
      end

      visible_trees
    end

    def part2
      transposed_grid = grid.transpose
      scenic_scores = []

      (1...grid.size - 1).each do |y|
        (1...grid.size - 1).each do |x|
          tree_size = grid[x][y]

          left = (
            grid[x][0..y - 1]
              .reverse
              .find_index { |size| size >= tree_size } ||
                grid[x][0..y - 1].reverse.size - 1
          ) + 1
          right = (
            grid[x][y + 1..]
              .find_index { |size| size >= tree_size } ||
                grid[x][y + 1..].size - 1
          ) + 1
          up = (
            transposed_grid[y][0..x - 1]
              .reverse
              .find_index { |size| size >= tree_size } ||
                transposed_grid[y][0..x - 1].reverse.size - 1
          ) + 1
          down = (
            transposed_grid[y][x + 1..]
              .find_index { |size| size >= tree_size } ||
                transposed_grid[y][x + 1..].size - 1
          ) + 1

          scenic_scores << left * right * up * down
        end
      end

      scenic_scores.max
    end

    private

    def raw_data
      File.read(
        File.join(File.dirname(__FILE__), "inputs", "day8", "entries.txt")
      )
    end

    def grid
      @grid ||= raw_data.split.map { |raw| raw.chars.map(&:to_i) }
    end
  end
end
