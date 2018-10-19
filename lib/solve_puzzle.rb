module SolvePuzzle
  def solve_puzzle
  end

  def make_board(string)
    string.scan(/([-<>=]+)/)
      .map { |element| element[0].split('') }
  end

  def to_str

  end
end
