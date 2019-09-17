# frozen_string_literal: true

require_relative '../lib/player'

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

def user_name
  name = []
  2.times do |i|
    puts "Please enter name of player #{i + 1}:"
    name << gets.strip
  end
end

def turn
  puts 'Choose a spot between 1-9'
  spot = gets.strip
  spot = input_to_index(spot)
  if valid_move?(spot)
    move(spot, current_player)
  else
    turn
  end
  display_board
end

def turn_count
  taken = 0
  @board.each do |i|
    taken += 1 if i.include? 'X' || i.include? 'O'
  end
  taken
end

def current_player
  player = nil
  if (turn_count % 2).zero?
    player = 'X'
  else
    player = 'O'
  end
  player
end

def move(board, index, current_player)
  board[index] = current_player
  puts "Now, #{current_player} move is displayed on the board"
end

get_name
turn

display_board(board)
