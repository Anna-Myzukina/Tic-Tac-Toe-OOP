# frozen_string_literal: true

require '../bin/main'

RSpec.describe Tictactoe do
  let(:player1) {Player.new(name: 'Nick') }
  let(:player2) {Player.new(name: 'Anna') }
  describe '#wecome' do
    it 'shoud clear terminal' do
      game = Tictactoe.new
      expect(game.wecome).to eq(nill)
  end
    it 'prints welcome message' do
      game = Tictactoe.new
      expect(game.welcome).to eq('Welcome to Tic Tac Toe')
  end
  it 'shoud add empty string in terminal' do
    game = Tictactoe.new
    expect(game.wecome).to eq(' ')
end
  describe '#move_board' do
    it 'takes position on board of current player and return current player symbol on board' do
      boardX = [' ', ' ', 'X', ' ', ' ', ' ', ' ', ' ', ' ']
      boardO = [' ', ' ', ' ', ' ', ' ', 'O', ' ', ' ', ' ']
      
      idx = 2
      expect(game.move_board(boardX, idx)).to be_truthy
      
      idx = 5
      expect(game.move_board(boardO, idx)).to be_truthy
    end
  end
  describe '#input_to_index' do
    it "accepts the user's input (a string) as an argument" do
      game = Tictactoe.new
      expect(game.input_to_index).to raise_error(ArgumentError)
    end

    it "converts the user's input (a string) into an integer" do
      game = Tictactoe.new
      expect(game.input_to_index('1')).to be_an(Integer)
    end

    it "converts the user's input from the user-friendly format (on a 1-9 scale) to the array-friendly format (where the first index starts at 0)" do
      game = Tictactoe.new
      expect(game.input_to_index('1')).to eq(0)
      expect(game.input_to_index('5')).to eq(4)
    end
  end
end
