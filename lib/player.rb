# frozen_string_literal: true

module Player
  def self.prb
    puts 'hello from module'
  end

  def self.position_taken?(board, index)
    !(board[index].nil? || board[index] == ' ')
  end

  def self.valid_move?(board, index)
    index.between?(1, 9) && !position_taken?(board, index)
  end
end
