require_relative 'tile'

class Board

  attr_accessor :grid

  def initialize()
    @grid = Array.new(9) { Array.new(9) }
  end

  def [](pos)
    x, y = pos
    @grid[x][y]
  end

  def []=(pos, value)
    x, y = pos
    @grid[x][y] = value
  end

  def populate
    deck = generate

    @grid.each_with_index do |row, idx1|
      row.each_index do |idx2|
        self[[idx1, idx2]] = deck.pop
      end
    end
  end

  def generate
    tiles = Array.new(70) {Tile.new}
    bombs = Array.new(11) {Tile.new(true)}

    (tiles + bombs).shuffle
  end

  def render_row(array)
    array.map{|tile| tile.to_s}.join(" ")
  end

  def render
    puts "   " + (0..8).to_a.join(" ")
    @grid.each_with_index do |row, idx|
      puts "#{idx} " + render_row(row)
    end
  end
end

if $PROGRAM_NAME == __FILE__
  board = Board.new
  # p board.grid #nil
  board.populate
  puts board.render #*
end
