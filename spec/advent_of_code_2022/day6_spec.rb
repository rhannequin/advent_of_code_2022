# frozen_string_literal: true

RSpec.describe AdventOfCode2022::Day6 do
  describe "#part1" do
    it "returns the number of characters to be processed from example1" do
      data = StringIO.new(example1)
      allow(File).to receive(:read).and_return(data.read)

      expect(described_class.new.part1).to eq(7)
    end

    it "returns the number of characters to be processed from example2" do
      data = StringIO.new(example2)
      allow(File).to receive(:read).and_return(data.read)

      expect(described_class.new.part1).to eq(5)
    end

    it "returns the number of characters to be processed from example3" do
      data = StringIO.new(example3)
      allow(File).to receive(:read).and_return(data.read)

      expect(described_class.new.part1).to eq(6)
    end

    it "returns the number of characters to be processed from example4" do
      data = StringIO.new(example4)
      allow(File).to receive(:read).and_return(data.read)

      expect(described_class.new.part1).to eq(10)
    end

    it "returns the number of characters to be processed from example5" do
      data = StringIO.new(example5)
      allow(File).to receive(:read).and_return(data.read)

      expect(described_class.new.part1).to eq(11)
    end

    it "computes the right challenge's answer" do
      expect(described_class.new.part1).to eq(1531)
    end
  end

  describe "#part2" do
    it "returns the number of characters to be processed from example1" do
      data = StringIO.new(example1)
      allow(File).to receive(:read).and_return(data.read)

      expect(described_class.new.part2).to eq(19)
    end

    it "returns the number of characters to be processed from example2" do
      data = StringIO.new(example2)
      allow(File).to receive(:read).and_return(data.read)

      expect(described_class.new.part2).to eq(23)
    end

    it "returns the number of characters to be processed from example3" do
      data = StringIO.new(example3)
      allow(File).to receive(:read).and_return(data.read)

      expect(described_class.new.part2).to eq(23)
    end

    it "returns the number of characters to be processed from example4" do
      data = StringIO.new(example4)
      allow(File).to receive(:read).and_return(data.read)

      expect(described_class.new.part2).to eq(29)
    end

    it "returns the number of characters to be processed from example5" do
      data = StringIO.new(example5)
      allow(File).to receive(:read).and_return(data.read)

      expect(described_class.new.part2).to eq(26)
    end

    it "computes the right challenge's answer" do
      expect(described_class.new.part2).to eq(2518)
    end
  end

  def example1
    <<~EOF
      mjqjpqmgbljsphdztnvjfqwrcgsmlb
    EOF
  end

  def example2
    <<~EOF
      bvwbjplbgvbhsrlpgdmjqwftvncz
    EOF
  end

  def example3
    <<~EOF
      nppdvjthqldpwncqszvftbrmjlhg
    EOF
  end

  def example4
    <<~EOF
      nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg
    EOF
  end

  def example5
    <<~EOF
      zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw
    EOF
  end
end
