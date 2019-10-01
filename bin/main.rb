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

  def move_board(idx)
    @board[idx] = @current_player.symb
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def turn
    @current_player = @current_player == @name[0] ? @name[1] : @name[0]
    puts "#{@current_player.name}, choose a spot between 1-9"
    spot = gets.strip.to_i
    until spot.positive?
      puts 'Please enter a valid move'
      spot = gets.strip.to_i
    end
    until @game.valid_move?(@board, input_to_index(spot))
      puts "#{@current_player.name}, choose a spot between 1-9 which is not taken"
      spot = gets.strip.to_i
    end
    move_board(input_to_index(spot))
    puts `clear`
    display_board
    # check if we have a winner or a draw
    if @game.won?(@board)
      puts "Congratulations #{@current_player.name} you won!!!" 
      @game_over = true
    elsif @game.draw?(turn_count)
      puts "It is a Draw!!!" 
      @game_over = true
    end
  end

  def turn_count
    @board.select {|e| e == 'X' || e == 'O'}.size
  end

  def user_name
    symbols = ['X', 'O']
    2.times do |i|
      puts "Please enter name of player #{symbols[i]}:"
      @name << Player.new(gets.strip, symbols[i])
    end
    until @name[1].name != @name[0].name
      puts "Your name should be different than #{@name[0].name}:"
      @name[1] = Player.new(gets.strip, 'O')
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

