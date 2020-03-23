class Board
  attr_reader :grid

  def initialize 
    @grid = empty_board
  end

  def empty_board
    hash = {}

    3.times do |row|
      ("a".."c").each do |column|
        hash["#{row + 1}#{column}"] = { move: nil, player: nil }
      end
    end

    hash
  end

  def print_grid
    value_to_print = (1..3).map do |row|
      grid_row = @grid.select {|key, value| key =~ /#{row}/ }
      grid_row.map {|key, value| "  #{value[:player]&.name || key}  " }.join('|')
    end

    print "\n\n"
    print value_to_print.join("\n--------------------\n")
    print "\n\n"
  end

  def save(move, player)
    @grid[move.choose_value][:move] = move
    @grid[move.choose_value][:player] = player
  end
end