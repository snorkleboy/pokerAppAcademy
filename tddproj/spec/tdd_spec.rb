require 'rspec'
require 'tdd'

RSpec.describe "#my_uniq" do
  it "removes duplicates" do
    expect([1, 2, 1, 3, 3].my_uniq).to eq([1, 2, 3])
  end
end

  describe "#two_sum" do
    it "gets elements that sum to zero" do
      expect( [-1, 0, 2, -2, 1].two_sum).to eq( [[0, 4], [2, 3]])
    end
    it "sorts the output" do
      expect([-1, 1, 2, -2, 1].two_sum).to eq([ [0, 1],[0,4],[2,3] ])
    end
  end

  describe "#transpose" do
    it "transposes" do
      a=  [ [0, 1, 2],
            [3, 4, 5],
            [6, 7, 8] ]

      b=  [ [0, 3, 6],
            [1, 4, 7],
            [2, 5, 8] ]
    expect(my_transpose(a)).to eq (b)
    end
  end


  describe "#stock_picker" do
    it "finds best trade day pair" do
      expect(stock_picker([10,7,13,15,40])).to eq([1,4])
    end
  end

  describe "HanoiTowers" do
    subject(:towers){HanoiTowers.new}
    context "initialize" do
      it "makes 3 arrays at initialize" do
        expect(towers.arr1).to be_an(Array)
        expect(towers.arr2).to be_an(Array)
        expect(towers.arr3).to be_an(Array)
      end

      it "makes 2 empty arrays and 1 with 3 disks" do
        expect(towers.arr1.length).to eq (3)
        expect(towers.arr2).to be_empty
        expect(towers.arr3).to be_empty
      end
    end
      context "playing" do
        it "recognizes win conditions" do
          towers.arr3=[3,2,1]
          expect(towers.won?).to eq (true)
        end

        it "prevents player from bigger disk onto smaller one" do
          arr1=[3,2]
          arr2=[1]
          expect(move_disk(arr1,arr2)).to raise_error(ArgumentError)
        end
      end
  end




  # towers of Hanoi
  #
  # Write a Towers of Hanoi game.
  #
  # Keep three arrays, which represents the piles of discs. Pick a representation of the discs to store in the arrays; maybe just a number representing their size. Don't worry too much about making the user interface pretty.
  #
  # In a loop, prompt the user (using gets) and ask what pile to select a disc from, and where to put it.
  #
  # After each move, check to see if they have succeeded in moving all the discs, to the final pile. If so, they win!
  #
  # Note: don't worry about testing the UI. Testing console I/O is tricky (don't bother checking gets or puts). Focus on:
  #
  # #move
  # #won?
