require_relative "cell"

class Minefield
  attr_reader :row_count, :column_count

  def initialize(row_count, column_count, mine_count)
    @column_count = column_count
    @row_count = row_count
    @mine_count = mine_count

    build_minefield
    plant_mines
  end

  # Return true if the cell been uncovered, false otherwise.
  def cell_cleared?(row, col)
    false
  end

  # Uncover the given cell. If there are no adjacent mines to this cell
  # it should also clear any adjacent cells as well. This is the action
  # when the player clicks on the cell.
  def clear(row, col)
  end

  # Check if any cells have been uncovered that also contained a mine. This is
  # the condition used to see if the player has lost the game.
  def any_mines_detonated?
    false
  end

  # Check if all cells that don't have mines have been uncovered. This is the
  # condition used to see if the player has won the game.
  def all_cells_cleared?
    cleared_cells = true
    @board.each do |row|
      row.each do |column|
        if column.contains_mine?
          cleared_cells = false
        end
      end
    end
    cleared_cells
  end

  # Returns the number of mines that are surrounding this cell (maximum of 8).
  def adjacent_mines(row, col)
    0
  end

  # Returns true if the given cell contains a mine, false otherwise.
  def contains_mine?(row, col)
    @minefield[row][col].contains_mine?
  end

  private

  # Create a data structure within an instance variable that will represent
  # the minefield.
  def build_minefield
    @minefield = []
    20.times do
      row = []
      20.times do
        row << Cell.new
      end
      @minefield << row
    end
  end

  # Distribute 65 mines amongst the individual minefield cells
  def plant_mines
    mine_counter = 65
    while mine_counter > 0
      rand_num1 = rand(20) + 1
      rand_num2 = rand(20) + 1
      if !@minefield[rand_num1][rand_num2].contains_mine?
        @minefield[rand_num1][rand_num2].place_mine
        mine_counter -= 1
      end
    end
  end
end
