# frozen_string_literal: true

class Player
  attr_reader :name, :symb

  def initialize(name)
    @name = name
    @symb = ''
  end

  def add_symb(symb)
    @symb = symb
  end
end
