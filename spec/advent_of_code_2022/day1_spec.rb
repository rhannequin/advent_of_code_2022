# frozen_string_literal: true

RSpec.describe AdventOfCode2022::Day1 do
  describe "#part1" do
    it "returns the max sum of calories" do
      data = StringIO.new(entries)
      allow(File).to receive(:read).and_return(data.read)

      expect(described_class.new.part1).to eq(24000)
    end
  end

  describe "#part2" do
    it "returns the sum of the 3 top sum of calories" do
      data = StringIO.new(entries)
      allow(File).to receive(:read).and_return(data.read)

      expect(described_class.new.part2).to eq(45000)
    end
  end

  def entries
    <<~EOF
      1000
      2000
      3000

      4000

      5000
      6000

      7000
      8000
      9000

      10000
    EOF
  end
end
