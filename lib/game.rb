# frozen_string_literal: true

class Game
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

  def valid_move?(board, index)
    index.between?(0, 9) && !position_taken?(board, index)
  end

  def position_taken?(board, index)
    !(board[index].nil? || board[index] == ' ')
  end

  def won?(board)
    WIN_COMBINATIONS.detect do |combo|
      board[combo[0]] == board[combo[1]] &&
        board[combo[1]] == board[combo[2]] && board[combo[0]] != ' '
    end
  end

  def draw?(turn_count)
    turn_count >= 9
  end

  def over?(board, turn_count)
    won?(board) || draw?(turn_count)
  end
end
