# frozen_string_literal: true

RSpec.describe AdventOfCode2022::Day11 do
  describe "#part1" do
    it "returns the sum of each signal strengths" do
      data = StringIO.new(entries)
      allow(File).to receive(:read).and_return(data.read)

      expect(described_class.new.part1).to eq(10605)
    end

    it "computes the right challenge's answer" do
      expect(described_class.new.part1).to eq(99852)
    end
  end

  describe "#part2" do
    it "returns the number positions visited by the tail" do
      data = StringIO.new(entries)
      allow(File).to receive(:read).and_return(data.read)

      expect(described_class.new.part2).to eq(2713310158)
    end

    it "computes the right challenge's answer" do
      expect(described_class.new.part2).to eq(25935263541)
    end
  end

  def entries
    <<~EOF
      Monkey 0:
        Starting items: 79, 98
        Operation: new = old * 19
        Test: divisible by 23
          If true: throw to monkey 2
          If false: throw to monkey 3
      
      Monkey 1:
        Starting items: 54, 65, 75, 74
        Operation: new = old + 6
        Test: divisible by 19
          If true: throw to monkey 2
          If false: throw to monkey 0
      
      Monkey 2:
        Starting items: 79, 60, 97
        Operation: new = old * old
        Test: divisible by 13
          If true: throw to monkey 1
          If false: throw to monkey 3
      
      Monkey 3:
        Starting items: 74
        Operation: new = old + 3
        Test: divisible by 17
          If true: throw to monkey 0
          If false: throw to monkey 1
    EOF
  end
end
