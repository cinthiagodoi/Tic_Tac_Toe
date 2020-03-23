require "./lib/player.rb"
require "./lib/board.rb"

class Game
  attr_reader :winner

  def initialize
    @board = Board.new
    @player_1 = Player.new('X', @board)
    @player_2 = Player.new('O', @board)
    @winner = nil

    run
  end

  def run
    @board.print_grid 
    while winner == nil do
      [@player_1, @player_2].each do |player|
        player.choose_move
        @board.print_grid 
        if player.won? 
          @winner = player.name 
          break
        elsif movements_left == 0
          @winner = 'no one'
          break
        end
      end
    end
  end

  def movements_left
    @board.grid.select {|k, v| v[:player] == nil }.size
  end
end
