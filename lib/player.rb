# frozen_string_literal: true

module Player
  def self.position_taken?(board, index)
    !(board[index].nil? || board[index] == ' ')
  end

  def self.valid_move?(board, index)
    index.between?(0, 9) && !position_taken?(board, index)
  end
end
