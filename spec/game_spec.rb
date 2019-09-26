# frozen_string_literal: true

require '../lib/game'

RSpec.describe Game do
  describe '#valid_move?' do
    it 'returns true/false based on whether the position is already occupied' do
      game = Game.new
      board = [' ', ' ', ' ', ' ', 'X', ' ', ' ', ' ', ' ']
      index = 0
      expect(game.valid_move?(board, index)).to be_truthy

      index = 4
      expect(game.valid_move?(board, index)).to be_falsey
    end
  end
  describe '#position_taken?' do
    it 'returns true/false based on whether the position is taken' do
      game = Game.new
      board = [' ', ' ', 'O', ' ', 'X', ' ', ' ', ' ', ' ']
      index = 2
      expect(game.position_taken?(board, index)).to be_truthy

      index = 5
      expect(game.position_taken?(board, index)).to be_falsey
    end
  end
end
