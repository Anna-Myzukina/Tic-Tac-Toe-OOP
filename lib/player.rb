# frozen_string_literal: true

module Player
  def position_taken?(board, index)
    !(board[index].nil? || board[index] == ' ')
  end

  def valid_move?(board, index)
    index.between?(0, 8) && !position_taken?(board, index)
  end
end
