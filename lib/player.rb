require './lib/move.rb'

class Player 
  attr_reader :name

  def initialize(name, board)
    @name = name
    @board = board
  end

  def choose_move
    move = Move.new(@board)

    unless move.valid?
      print "\nInvalid movement, try again!\n"
      return choose_move
    end
    
    @board.save(move, self)
  end

  def won?
    won = false
    moves = @board.grid.select {|key, value| value[:player]&.name == @name }

    (1..3).each do |row|
      won = true if moves.select{|key, value| key =~ /#{row}/ }.size == 3
    end

    ('a'..'c').each do |column|
      won = true if moves.select{|key, value| key =~ /#{column}/ }.size == 3
    end

    diagonal_moves = moves.select do |key, value| 
      key == '1a' || key == '2b' || key == '3c'
    end

    inverse_diagonal = moves.select do |key, value| 
      key == '3a' || key == '2b' || key == '1c'
    end

    won = true if diagonal_moves.size == 3 || inverse_diagonal.size == 3

    won
  end
end