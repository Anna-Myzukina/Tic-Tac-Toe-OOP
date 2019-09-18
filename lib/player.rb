# frozen_string_literal: true

module Player
  def self.move(board, index, current_player)
    board[index] = current_player
    p board
    puts "Now, #{current_player} move is displayed on the board"
  end

  def position_taken?(board, index)
    !(board[index].nil? || board[index] == ' ')
  end

  def valid_move?(board, index)
    index.between?(0, 8) && !position_taken?(board, index)
  end
end
