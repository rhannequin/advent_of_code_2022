# frozen_string_literal: true

RSpec.describe AdventOfCode2022::Day7 do
  describe "#part1" do
    it "the sum of the total sizes of directories with total size below 100000" do
      data = StringIO.new(entries)
      allow(File).to receive(:read).and_return(data.read)

      expect(described_class.new.part1).to eq(95437)
    end

    it "computes the right challenge's answer" do
      expect(described_class.new.part1).to eq(1427048)
    end
  end

  describe "#part2" do
    it "size of the directory that needs to be deleted" do
      data = StringIO.new(entries)
      allow(File).to receive(:read).and_return(data.read)

      expect(described_class.new.part2).to eq(24933642)
    end

    it "computes the right challenge's answer" do
      expect(described_class.new.part2).to eq(2940614)
    end
  end

  def entries
    <<~EOF
      $ cd /
      $ ls
      dir a
      14848514 b.txt
      8504156 c.dat
      dir d
      $ cd a
      $ ls
      dir e
      29116 f
      2557 g
      62596 h.lst
      $ cd e
      $ ls
      584 i
      $ cd ..
      $ cd ..
      $ cd d
      $ ls
      4060174 j
      8033020 d.log
      5626152 d.ext
      7214296 k
    EOF
  end
end
