# frozen_string_literal: true

require_relative '../lib/player'

describe '#initialize' do
  it 'initialize name for player' do
    player = Player.new('Anna', 'X')
    expect(player.instance_variable_get(:@name)).to eq('Anna')
  end
  it 'initialize symbol for player' do
    player = Player.new('Anna', 'X')
    expect(player.instance_variable_get(:@symb)).to eq('X')
  end
end