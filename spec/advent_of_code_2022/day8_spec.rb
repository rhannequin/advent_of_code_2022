# frozen_string_literal: true

RSpec.describe AdventOfCode2022::Day8 do
  describe "#part1" do
    it "returns the number of visible trees" do
      data = StringIO.new(entries)
      allow(File).to receive(:read).and_return(data.read)

      expect(described_class.new.part1).to eq(21)
    end

    it "computes the right challenge's answer" do
      expect(described_class.new.part1).to eq(1679)
    end
  end

  describe "#part2" do
    it "returns the highest scenic score possible for any tree" do
      data = StringIO.new(entries)
      allow(File).to receive(:read).and_return(data.read)

      expect(described_class.new.part2).to eq(8)
    end

    it "computes the right challenge's answer" do
      expect(described_class.new.part2).to eq(536625)
    end
  end

  def entries
    <<~EOF
      30373
      25512
      65332
      33549
      35390
    EOF
  end
end
