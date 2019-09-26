require '../lib/game'

RSpec.describe Game do
describe '#valid_move?' do
  it 'returns true/false based on whether the position is already occupied' do
    game = Game.new
    board = [" ", " ", " ", " ", "X", " ", " ", " ", " "]
        index = 0
        expect(game.valid_move?(board, index)).to be_truthy

        index = 4
        expect(game.valid_move?(board, index)).to be_falsey
  end
end
describe '#position_taken?' do
  it 'returns true/false'
end
end