# frozen_string_literal: true

RSpec.describe AdventOfCode2022::Day5 do
  describe "#part1" do
    it "returns the top crates" do
      data = StringIO.new(entries)
      allow(File).to receive(:read).and_return(data.read)

      expect(described_class.new.part1).to eq("CMZ")
    end

    it "computes the right challenge's answer" do
      expect(described_class.new.part1).to eq("VQZNJMWTR")
    end
  end

  describe "#part2" do
    it "returns the top crates" do
      data = StringIO.new(entries)
      allow(File).to receive(:read).and_return(data.read)

      expect(described_class.new.part2).to eq("MCD")
    end

    it "computes the right challenge's answer" do
      expect(described_class.new.part2).to eq("NLCDCLVMQ")
    end
  end

  def entries
    <<~EOF
          [D]    
      [N] [C]    
      [Z] [M] [P]
       1   2   3 

      move 1 from 2 to 1
      move 3 from 1 to 3
      move 2 from 2 to 1
      move 1 from 1 to 2
    EOF
  end
end
