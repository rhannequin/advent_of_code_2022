# frozen_string_literal: true

RSpec.describe AdventOfCode2022::Day9 do
  describe "#part1" do
    it "returns the number positions visited by the tail" do
      data = StringIO.new(example1)
      allow(File).to receive(:read).and_return(data.read)

      expect(described_class.new.part1).to eq(13)
    end

    it "computes the right challenge's answer" do
      expect(described_class.new.part1).to eq(5878)
    end
  end

  describe "#part2" do
    it "returns the number positions visited by the tail" do
      data = StringIO.new(example2)
      allow(File).to receive(:read).and_return(data.read)

      expect(described_class.new.part2).to eq(36)
    end

    it "computes the right challenge's answer" do
      expect(described_class.new.part2).to eq(2405)
    end
  end

  def example1
    <<~EOF
      R 4
      U 4
      L 3
      D 1
      R 4
      D 1
      L 5
      R 2
    EOF
  end

  def example2
    <<~EOF
      R 5
      U 8
      L 8
      D 3
      R 17
      D 10
      L 25
      U 20
    EOF
  end
end
