#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative '../lib/player'

class Tictactoe
  attr_accessor :board, :name

  def initialize
    @board = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
    @name = []
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
    @board[idx] = 'X'
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
    display_board
  end

  def turn_count
    taken = 0
    @board.each do |i|
      taken += 1 unless i.nil?
    end
    taken
  end

  def user_name
    2.times do |i|
      puts "Please enter name of player #{i + 1}:"
      @name << gets.strip
    end
  end
end

puts 'Welcome to Tic Tac Toe'
puts ' '
board = Tictactoe.new

board.display_board
board.user_name
3.times do |i|
  board.turn
  board.move_board(i)
  board.display_board
end

puts 'Congratulations you WON!!!'
