module SolvePuzzle
  def solve_puzzle
  end

  def make_board(string)
    string.scan(/([-<>=]+)/)
      .map { |element| element[0].split('') }
  end

  def format_string(solved_board)
    num_of_letters = solved_board.length
    letters = [*('a'..'z')].slice(0, num_of_letters)

    formated_string = solved_board.each_with_index { |row, idx| row.unshift(letters[idx].upcase) }
    formated_string = formated_string.map { |row| row.push("\n") }
    formated_string = formated_string.unshift(["ABCD\n"])
    formated_string = formated_string.map(&:join).join
    formated_string
  end

  def solve(starting_board)
    starting_board.each_with_index do |row_array, row_index|
      row_array.each_with_index do |cell, column_index|
        if cell == "="
          next 
        elsif cell == ">" || cell == "<"
          next 
        else
          if row_index == column_index
            row_array[column_index] = "="
          else
            row_index > column_index ? row_array[column_index] = ">" : row_array[column_index] = "<"
          end
        end
      end
    end
    starting_board
  end
end

