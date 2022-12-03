# frozen_string_literal: true

RSpec.describe AdventOfCode2022::Day2 do
  describe "#part1" do
    it "returns the total score when following the strategy guide" do
      data = StringIO.new(entries)
      allow(File).to receive(:read).and_return(data.read)

      expect(described_class.new.part1).to eq(15)
    end
  end

  describe "#part2" do
    it "returns the total score when following the strategy guide" do
      data = StringIO.new(entries)
      allow(File).to receive(:read).and_return(data.read)

      expect(described_class.new.part2).to eq(12)
    end
  end

  def entries
    <<~EOF
      A Y
      B X
      C Z
    EOF
  end
end
