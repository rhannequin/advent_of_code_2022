# frozen_string_literal: true

RSpec.describe AdventOfCode2022::Day3 do
  describe "#part1" do
    it "returns the sum of priorities of common compartments" do
      data = StringIO.new(entries)
      allow(File).to receive(:read).and_return(data.read)

      expect(described_class.new.part1).to eq(157)
    end
  end

  describe "#part2" do
    it "returns the sum of priorities of groups" do
      data = StringIO.new(entries)
      allow(File).to receive(:read).and_return(data.read)

      expect(described_class.new.part2).to eq(70)
    end
  end
end

def entries
  <<~EOF
    vJrwpWtwJgWrhcsFMMfFFhFp
    jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL
    PmmdzqPrVvPwwTWBwg
    wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn
    ttgJtRGJQctTZtZT
    CrZsJsPPZsGzwwsLwLmpwMDw
  EOF
end
