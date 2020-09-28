class QueenAttack
  attr_reader :position
  ROW = 0
  COLUMN = 1

  def initialize(position)
    @position = position
    validate!
  end

  def attack?(opponent)
    row?(opponent) || column?(opponent) || diagonal?(opponent)
  end

  private

  def validate!
    if @position[ROW].negative? || @position[ROW] > 7 ||
       @position[COLUMN].negative? || @position[COLUMN] > 7
      raise ArgumentError
    end
  end

  def row?(opponent)
    @position[ROW] == opponent.position[ROW]
  end

  def column?(opponent)
    @position[COLUMN] == opponent.position[COLUMN]
  end

  def diagonal?(opponent)
    row_difference = @position[ROW] - opponent.position[ROW]
    column_difference = @position[COLUMN] - opponent.position[COLUMN]

    row_difference.abs == column_difference.abs
  end
end
