# frozen_string_literal: true

require '../bin/main'

RSpec.describe Tictactoe do
  describe '#move_board' do
    it 'takes position on board of current player and return current player symbol on board' do
      idx = 2
      boardX= [' ', ' ', 'X', ' ', ' ', ' ', ' ', ' ', ' ']
      boardO= [' ', ' ', 'O', ' ', ' ', ' ', ' ', ' ', ' ']
      expect(game.move_board(idx)).to eq(boardX)
      expect(game.move_board(idx)).to eq(boardO)
    end
  end
end