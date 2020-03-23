class Move
  attr_reader :choose_value

  def initialize(board)
    @grid = board.grid

    print "Choose your move: "
    @choose_value = gets.chomp.downcase
  end

  def valid?
    @grid.has_key?(@choose_value) && @grid[@choose_value][:move] == nil 
  end
end