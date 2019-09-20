#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative '../lib/player'
require_relative '../lib/game'

class Tictactoe
  attr_accessor :board, :name

  def initialize
    @board = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
    @name = []
    @game_over = false
    @player = Player.new
    @game = Game.new
  end

  def welcome
    puts `clear`
    puts 'Welcome to Tic Tac Toe'
    puts ' '
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts '-----------'
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts '-----------'
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    puts ' '
  end

  def move(index, current_player)
    @board[index] = @current_player
    p board
    puts "Now, #{current_player} move is displayed on the board"
  end

  def move_board(idx)
    if @current_player == @name[0] 
      sign = 'X'
    elsif @current_player == @name[1]
      sign = 'O'
    end
    @board[idx] = sign
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def turn
    @current_player = @current_player == @name[0] ? @name[1] : @name[0]
    puts "#{@current_player}, choose a spot between 1-9"
    spot = gets.strip.to_i
    until spot.positive?
      puts 'Please enter a valid move'
      spot = gets.strip.to_i
    end
    until @player.valid_move?(@board, input_to_index(spot))
      puts "#{@current_player}, choose a spot between 1-9 which is not taken"
      spot = gets.strip.to_i
    end
    move_board(input_to_index(spot))
    puts `clear`
    display_board
    # check if we have a winner or a draw
    if @game.won?(@board)
      puts "Congratulations #{@current_player} you won!!!" 
      @game_over = true
    elsif @game.full?(turn_count)
      puts "It is a Draw!!!" 
      @game_over = true
    end
  end

  def turn_count
    @board.select {|e| e == 'X' || e == 'O'}.size
  end

  def user_name
    2.times do |i|
      puts "Please enter name of player #{i + 1}:"
      @name << gets.strip
    end
    until @name[1] != @name[0]
      puts "Your name should be different than #{@name[0]}:"
      @name[1] = gets.strip
    end
  end

  def play
    welcome
    display_board
    user_name
    until @game_over
      turn
    end
  end
    
end

board = Tictactoe.new
board.play

