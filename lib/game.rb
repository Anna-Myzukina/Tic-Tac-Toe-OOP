# frozen_string_literal: true

require_relative '../lib/player'

module Game
  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [6, 4, 2],
    [0, 4, 8]
  ].freeze

  def self.won?(board)
    WIN_COMBINATIONS.detect do |combo|
      board[combo[0]] == board[combo[1]] &&
        board[combo[1]] == board[combo[2]] && board[combo[0]] != ' '
    end
  end

  def self.full?(turn_count)
    turn_count == 9
  end

  def self.draw?
    !won? && full?
  end

  def self.over?(board, turn_count)
    won?(board) || full?(turn_count)
  end
end
