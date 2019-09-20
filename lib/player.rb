# frozen_string_literal: true

class Player
  def position_taken?(board, index)
    !(board[index].nil? || board[index] == ' ')
  end

  def valid_move?(board, index)
    index.between?(0, 9) && !position_taken?(board, index)
  end
end
