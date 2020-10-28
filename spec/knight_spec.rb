require './lib/knights_travails'

describe Knight do
  describe "#knights_travails" do
    it 'returns the same square the knight is on' do
      knight = Knight.new
      path_taken = knight.knights_travails([3, 3], [3, 3])
      expect([[3, 3]]).to eql(path_taken)
    end

    it 'returns the path to a different square' do
      knight = Knight.new
      path_taken = knight.knights_travails([5, 2], [3, 6])
      expect([[5, 2], [4, 4], [3,6]]).to eql(path_taken)
    end

    it 'returns the path to a different square' do
      knight = Knight.new
      path_taken = knight.knights_travails([3, 3], [4, 3])
      expect([[3, 3], [5,4], [3,5], [4,3]]).to eql(path_taken)
    end

    it 'returns the path to a different square' do
      knight = Knight.new
      path_taken = knight.knights_travails([3, 3], [4, 3])
      expect([[3, 3], [5,4], [3,5], [4, 3]]).to eql(path_taken)
    end

    it 'returns the path to a different square' do
      knight = Knight.new
      path_taken = knight.knights_travails([0, 0], [0, 4])
      expect([[0, 0], [1,2], [0,4]]).to eql(path_taken)
    end

    it 'return nil for invalid inputs' do
      knight = Knight.new
      path_taken = knight.knights_travails("dogs", "cats")
      expect(path_taken).to eql(nil)
    end

  end
end
