# frozen_string_literal: true

module AdventOfCode2022
  class Day7
    DIR_SIZE_LIMIT = 100_000
    NEED_SPACE_DISK_SIZE = 40_000_000

    def part1
      fs = compute_file_system

      fs
        .flat_system
        .select { |node| node.size <= DIR_SIZE_LIMIT }
        .map(&:size)
        .sum
    end

    def part2
      fs = compute_file_system

      fs
        .flat_system
        .map(&:size)
        .select { |size| size >= fs.size - NEED_SPACE_DISK_SIZE }
        .min
    end

    private

    def raw_data
      File.read(
        File.join(File.dirname(__FILE__), "inputs", "day7", "entries.txt")
      )
    end

    def compute_file_system
      cdw = root = FileSystem.new("/")

      raw_data
        .split("\n")
        .each do |log_raw|
          case log_raw
          when /^\$ cd \/$/
            cdw = root
          when /^\$ cd \.\.$/
            cdw = cdw.parent
          when /^\$ cd (.+)$/
            cdw = cdw.children[$1]
          else
            cdw.build(log_raw)
          end
        end

      root
    end
  end

  class FileSystem
    attr_reader :name, :parent, :children, :files

    def initialize(name, parent = nil)
      @name = name
      @parent = parent
      @children = {}
      @files = {}
    end

    def build(raw)
      case raw
      when /^dir (.+)$/
        @children[$1] ||= self.class.new($1, self)
      when /^(\d+) (.+)$/
        @files[$2] = $1.to_i
      end
    end

    def flat_system
      [self, @children.values.map(&:flat_system)].flatten
    end

    def size
      @children.values.map(&:size).sum + @files.values.sum
    end
  end
end
