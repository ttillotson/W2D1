module Slideable
  HORIZONTAL_DIRS = [[0, 1], [0, -1], [1, 0] , [-1, 0]]
  DIAGONAL_DIRS = [[1, 1], [-1, -1], [1, -1], [-1, 1]]

  def diag_test(start_pos, end_pos)
    x_diff = start_pos[0] + end_pos[0]
    y_diff = start_pos[1] + end_pos[1]
    return false unless x_diff == y_diff
    start_pos.reduce(:+).even? == end_pos.reduce(:+).even?
  end

  def horiz_test(start_pos, end_pos)
    unless start_pos[0] == end_pos[0] || start_pos[1] == end_pos[1]
      return false
    end
    true
  end

  def move_dir
    self.piece
  end

  def move(move_dir, start_pos, end_pos)
    if HORIZONTAL_DIR.include?(move_dir)
  end
end
