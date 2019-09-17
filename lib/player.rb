# frozen_string_literal: true

def input_to_index(user_input)
  user_input.to_i - 1
  end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == ' ')
end

def valid_move?(board, index)
  index.between?(0, 8) && !position_taken?(board, index)
end
