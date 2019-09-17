# frozen_string_literal: true

module UserInterface
  def display_board(the_board)
    puts " #{the_board[0]} | #{the_board[1]} | #{the_board[2]} "
    puts '-----------'
    puts " #{the_board[3]} | #{the_board[4]} | #{the_board[5]} "
    puts '-----------'
    puts " #{the_board[6]} | #{the_board[7]} | #{the_board[8]} "
  end
  puts 'Welcome to Tic Tac Toe'
  board = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
  display_board(board)

  def take_spot()
    puts 'Choose a spot between 1-9'
    spot = gets.strip
    display_board(board)
  end
end
