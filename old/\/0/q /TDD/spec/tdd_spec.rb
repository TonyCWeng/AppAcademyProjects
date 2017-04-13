require 'tdd'
require 'rspec'

describe TDD do
  let(:tdd) {TDD.new}
  describe '#my_uniq' do
    array = [5,5,1,2,3,4,4]
    it 'removes all duplicates and returns in original order' do
      expect(tdd.my_uniq(array)).to eq([5,1,2,3,4])
    end
    it 'doesn\'t modify original array' do
      expect(tdd.my_uniq(array)).not_to be array
    end
  end

  describe '#two_sum' do
    array = [2, 3, -2, 0]
    it 'returns pair indicies that sum to 0 in order' do
      expect(array.two_sum).to eq([[0, 2]])
    end
  end

  describe "#my_transpose" do
    arr = [[1,2,3], [4,5,6], [7,8,9]]
    it 'return rows as columns' do
      expect(arr.my_transpose).to eq([[1,4,7], [2,5,8], [3,6,9]])
    end
    it 'doesn\'t call built-in #transpose' do
      expect(arr).not_to receive(:transpose)
      arr.my_transpose
    end
  end

  describe '#stock_picker' do
    arr = [10,0,2,8,5,20,16,32,4,76]
    it 'returns most profitable pair of days' do
      expect(arr.stock_picker).to eq([1,9])
    end
    it 'makes sure the first element is less than the second' do
      expect(arr.stock_picker).to eq(arr.stock_picker.sort)
    end
  end

  describe 'towers_of_hanoi' do
    let(:game) {Towers_Of_Hanoi.new}

    describe '#initialize' do
      it 'creates an array of three arrays' do
        expect(game.towers.length).to eq(3)
      end
      it 'places 3 discs in the first array' do
        expect(game.towers[0].length).to eq(3)
      end
      it 'places discs in a descending order' do
        expect(game.towers[0]).to eq([3,2,1])
      end
    end

    describe '#move' do
      it 'moves one piece at a time' do
        game.move(0, 1)
        expect(game.towers).to eq([[3,2], [1], []])
      end
      it 'raises error if bigger piece is moved onto smaller piece' do
        game.towers = [[3,2], [1], []]
        expect {game.move(0,1)}.to raise_error("Invalid move")
      end
      it 'moves pieces onto empty spaces' do
        game.towers = [[3,2], [1], []]
        game.move(1, 2)
        expect(game.towers).to eq([[3,2], [], [1]])
      end
    end

    describe '#won?' do
      it 'returns true if the game is won' do
        game.towers = [[], [3,2,1], []]
        expect(game.won?).to eq(true)
        game.towers = [[], [], [3,2,1]]
        expect(game.won?).to eq(true)
      end
      it 'returns false if the game isn\'t won' do
        game.towers = [[3], [2], [1]]
        expect(game.won?).to eq(false)
      end
    end
  end

end
