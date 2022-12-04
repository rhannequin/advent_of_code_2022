# frozen_string_literal: true

RSpec.describe AdventOfCode2022::Day4 do
  describe "#part1" do
    it "returns the number of fully contained assignment pairs" do
      data = StringIO.new(entries)
      allow(File).to receive(:read).and_return(data.read)

      expect(described_class.new.part1).to eq(2)
    end
  end

  describe "#part2" do
    it "returns the number of overlapping assignments pairs" do
      data = StringIO.new(entries)
      allow(File).to receive(:read).and_return(data.read)

      expect(described_class.new.part2).to eq(4)
    end
  end

  def entries
    <<~EOF
      2-4,6-8
      2-3,4-5
      5-7,7-9
      2-8,3-7
      6-6,4-6
      2-6,4-8
    EOF
  end
end
