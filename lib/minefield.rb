require_relative "helper.rb"

class Minefield
  attr_reader :row_count, :column_count
  ADJACENT_COORDINATES = [ [-1, 0], [1, 0], [0, -1], [0, 1], [-1, -1], [1, 1], [-1, 1], [1, -1] ]

  def initialize(row_count, column_count, mine_count)
    @column_count = column_count
    @row_count = row_count
    @mine_count = mine_count

    build_minefield
    plant_mines
  end

  # Return true if the cell been uncovered, false otherwise.
  def cell_cleared?(row, col)
    @minefield[row][col].revealed?
  end

  # Uncover the given cell. If there are no adjacent mines to this cell
  # it should also clear any adjacent cells as well. This is the action
  # when the player clicks on the cell.
  def clear(row, col)
    @minefield[row][col].reveal!

    if self.adjacent_mines(row, col) == 0
      ADJACENT_COORDINATES.each do |coordinate|
        if on_board?(row + coordinate[0], col + coordinate[1])
          clear(row + coordinate[0], col + coordinate[1])
        end
      end
    end
  end

  def on_board?(row, col)
    return row >= 0 && row <= 20 && col >= 0 && col <= 20
  end

  # Check if any cells have been uncovered that also contained a mine. This is
  # the condition used to see if the player has lost the game.
  def any_mines_detonated?
    cells_detonated = false
    @minefield.each do |row|
      row.each do |column|
        if column.contains_mine? && column.revealed?
          cells_detonated = true
        end
      end
    end
    cells_detonated
  end

  # Check if all cells that don't have mines have been uncovered. This is the
  # condition used to see if the player has won the game.
  def all_cells_cleared?
    cleared_cells = true
    @minefield.each do |row|
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
    adjacent_mine_counter = 0
    ADJACENT_COORDINATES.each do |coordinate|
      if on_board?(row + coordinate[0], col + coordinate[1])
        if contains_mine?(row + coordinate[0], col + coordinate[1])
          adjacent_mine_counter += 1
        end
      end
    end
    adjacent_mine_counter
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

  # Distribute mines amongst the individual minefield cells
  def plant_mines
    while @mine_count > 0
      rand_num1 = rand(20)
      rand_num2 = rand(20)
      if !@minefield[rand_num1][rand_num2].contains_mine?
        @minefield[rand_num1][rand_num2].place_mine
        @mine_count -= 1
      end
    end
  end
end

# old methods:
# def adjacent_mines(row, col)
#   adjacent_mine_counter = 0
#
#   if on_board?(row - 1, col)
#     if contains_mine?(row - 1, col)
#       adjacent_mine_counter += 1
#     end
#   elsif on_board?(row + 1, col)
#     if contains_mine?(row + 1, col)
#       adjacent_mine_counter += 1
#     end
#   elsif on_board?(row, col - 1)
#     if contains_mine?(row, col - 1)
#       adjacent_mine_counter += 1
#     end
#   elsif on_board?(row, col + 1)
#     if contains_mine?(row, col + 1)
#       adjacent_mine_counter += 1
#     end
#   elsif on_board?(row - 1, col - 1)
#     if contains_mine?(row - 1, col - 1)
#       adjacent_mine_counter += 1
#     end
#   elsif on_board?(row + 1, col + 1)
#     if contains_mine?(row + 1, col + 1)
#       adjacent_mine_counter += 1
#     end
#   elsif on_board?(row - 1, col + 1)
#     if contains_mine?(row - 1, col + 1)
#       adjacent_mine_counter += 1
#     end
#   elsif on_board?(row + 1, col - 1)
#     if contains_mine?(row + 1, col - 1)
#       adjacent_mine_counter += 1
#     end
#   end
#   adjacent_mine_counter
# end

# def clear(row, col)
#   @minefield[row][col].reveal!
#   # if on_board?(row - 1, col)
#   #   if !contains_mine?(row - 1, col)
#   #     @minefield[row - 1][col].reveal!
#   #     self.adjacent_mines(row - 1, col)
#   #   end
#   # elsif on_board?(row + 1, col)
#   #   if !contains_mine?(row + 1, col)
#   #     @minefield[row + 1][col].reveal!
#   #     self.adjacent_mines(row + 1, col)
#   #   end
#   # elsif on_board?(row, col - 1)
#   #   if !contains_mine?(row, col - 1)
#   #     @minefield[row][col - 1].reveal!
#   #     self.adjacent_mines(row, col - 1)
#   #   end
#   # elsif on_board?(row, col + 1)
#   #   if !contains_mine?(row, col + 1)
#   #     @minefield[row][col + 1].reveal!
#   #     self.adjacent_mines(row, col + 1)
#   #   end
#   # elsif on_board?(row - 1, col - 1)
#   #   if !contains_mine?(row - 1, col - 1)
#   #     @minefield[row - 1][col - 1].reveal!
#   #     self.adjacent_mines(row - 1, col - 1)
#   #   end
#   # elsif on_board?(row + 1, col + 1)
#   #   if !contains_mine?(row + 1, col + 1)
#   #     @minefield[row + 1][col + 1].reveal!
#   #     self.adjacent_mines(row + 1, col + 1)
#   #   end
#   # elsif on_board?(row - 1, col + 1)
#   #   if !contains_mine?(row - 1, col + 1)
#   #     @minefield[row - 1][col + 1].reveal!
#   #     self.adjacent_mines(row - 1, col + 1)
#   #   end
#   # elsif on_board?(row + 1, col - 1)
#   #   if !contains_mine?(row + 1, col - 1)
#   #     @minefield[row + 1][col - 1].reveal!
#   #     self.adjacent_mines(row + 1, col - 1)
#   #   end
#   # end
#
#   # dev diagram
#   # 0, 0    0, 1    0, 2
#   # 1, 0   <1, 1>   1, 2
#   # 2, 0    2, 1    2, 2
#   # [ [0, 0], [0, 1], [0, 2], [1, 0], [1, 1], [1, 2], [2, 0], [2, 1], [2, 2] ]
# end
