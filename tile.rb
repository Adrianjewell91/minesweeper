class Tile
  attr_accessor :revealed, :bomb

  def initialize(bomb = false)
    @revealed = false
    @bomb = bomb
  end

  def reveal
    @revealed = true
  end

  def face
    @bomb ? "b" : "_"
  end

  def to_s
    @revealed ? face : "*"
  end

end

if __FILE__ == $PROGRAM_NAME
  tile = Tile.new
  p tile.to_s # *
  tile.reveal
  p tile.to_s # _
  tile.bomb = true
  p tile.to_s # b
end
