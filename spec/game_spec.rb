# frozen_string_literal: true

require '../lib/game'

RSpec.describe Game do
  let(:game) { Game.new }

  describe '#valid_move?' do
    it 'returns true/false based on whether the position is already occupied' do
      board = [' ', ' ', ' ', ' ', 'X', ' ', ' ', ' ', ' ']
      index = 0
      expect(game.valid_move?(board, index)).to be_truthy

      index = 4
      expect(game.valid_move?(board, index)).to be_falsey
    end
  end

  describe '#position_taken?' do
    it 'returns true/false based on whether the position is taken' do
      board = [' ', ' ', 'O', ' ', 'X', ' ', ' ', ' ', ' ']
      index = 2
      expect(game.position_taken?(board, index)).to be_truthy

      index = 5
      expect(game.position_taken?(board, index)).to be_falsey
    end
  end

  describe '#won?' do
    it 'returns true/false if there winner or not' do
      board_false = [' ', ' ', 'O', ' ', 'X', ' ', ' ', ' ', ' ']
      board_true = [' ', ' ', '0', ' ', '0', ' ', '0', ' ', ' ']
      expect(game.won?(board_false)).to be_falsey
      expect(game.won?(board_true)).to be_truthy
    end
  end

  describe '#full?' do
    it 'return true/false if board is full or not' do
      turn_count = 10
      expect(game.full?(turn_count)).to be_truthy
      turn_count = 5
      expect(game.full?(turn_count)).to be_falsey
    end
  end

  describe '#over?' do
    it 'returns true/false if game is won or not' do
      board_true = [' ', 'X', '0', ' ', '0', ' ', '0', ' ', 'X']
      board_false = [' ', ' ', 'O', ' ', 'X', ' ', ' ', ' ', ' ']
      turn_count = 9
      expect(game.over?(board_true, turn_count)).to be_truthy
      expect(game.over?(board_false, turn_count)).to be_truthy
      turn_count = 5
      expect(game.over?(board_true, turn_count)).to be_truthy
      expect(game.over?(board_false, turn_count)).to be_falsey
    end
  end
end
