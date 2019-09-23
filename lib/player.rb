# frozen_string_literal: true

class Player
  attr_reader :name, :symb

  def initialize(name, symb)
    @name = name
    @symb = symb
  end

  def add_symb(symb)
    @symb = symb
  end
end
