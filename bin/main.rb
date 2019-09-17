`# frozen_string_literal: true`

require '../lib/player'

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

def turn
    puts "Choose a spot between 1-9"
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
    if i == "X" || i == "O"
    taken += 1
    end
end
return taken
end

def current_player
player = nil
if turn_count() % 2 == 0
  player = 'X'
else
  player = 'O'
end
return player
end

def move(board, index, current_player)
board[index] = current_player
puts "Now, #{current_player} move is displayed on the board"
end

display_board(board)
  