module SolvePuzzle
  attr_accessor :starting_board, :not_solved


  #def initialize(string)
  #@not_solved = true
  # make the board
    #@board = string.scan(/([-<>=]+)/)
      #.map { |element| element[0].split('') }
  #end

  def solve(string)
    @starting_board = make_board(string)
    4.times do |_|
      solve_puzzle(starting_board)
    end
    
    format_string(starting_board)
  end

  def valid_puzzle(string)
    make_board(string).map(&:even?)
  end

  def make_board(string)
    string.scan(/([-<>=]+)/)
      .map { |element| element[0].split('') }
  end

  #def to_s
  def format_string(solved_board)
    num_of_letters = solved_board.length
    letters = [*('a'..'z')].slice(0, num_of_letters)

    formated_string = solved_board.each_with_index { |row, idx| row.unshift(letters[idx].upcase) }
    formated_string = formated_string.map { |row| row.push("\n") }
    formated_string = formated_string.unshift(["ABCD\n"])
    formated_string = formated_string.map(&:join).join
    formated_string
  end


  #def solve_puzzle(starting_board)
  def solve_puzzle(starting_board)
    return starting_board if solved?(starting_board)
    #return true if puzzle.solved?
    starting_board.each_with_index do |row_array, row_index|
      row_array.each_with_index do |cell, column_index|
        reversed_position = starting_board[column_index][row_index]

        if [row_index] == [column_index]
          starting_board[column_index][row_index] = eql_sym
        end
        next if cell_empty?(cell)

        if cell == greater_then && cell_empty?(reversed_position) 
          starting_board[column_index][row_index] = opposite(cell)
        end
        if cell == less_then && cell_empty?(reversed_position) 
          starting_board[column_index][row_index] = opposite(cell)
        end

        #if starting_board[row_index][column_index] == ">" &&
            #starting_board[column_index][row_index] == "-"
          #starting_board[column_index][row_index] = "<"
        #elsif starting_board[row_index][column_index] == "<" &&
          #starting_board[column_index][row_index] == "-"
          #starting_board[column_index][row_index] = ">"
        #elsif starting_board[row_index][column_index] == "=" &&
          #starting_board[column_index][row_index] == "-"
          #starting_board[column_index][row_index] == "="
        #end
        # if column_index == row_index starting_board[column_index][row_index] = "="
      end
    end
    #puts ' *' * 15
    #puts solved?(starting_board)
    starting_board
  end

  # TODO refactor
  def opposite(cell)
    if greater_then
      less_then
    elsif less_then
      greater_then
    else
      eql
    end
  end

  def greater_then
    ">"
  end
  def less_then
    "<"
  end
  def eql_sym
    "="
  end

  def cell_empty?(cell)
    cell == "-"
  end

  def solved?(board)
    !board.flatten.include?("-")
  end

  #def print_new_board(board)
    #board.each_with_index do |row_array, row_index|
      #row_array.each_with_index do |cell, column_index|
        ##puts "#{row_array[cell]} and it partner to the right #{row_array[cell+1]}"
        ##puts row_array[cell] > row_array[cell+1]
        #puts "cell: #{cell}   #{row_array}}"
      #end
    #end
  #end

end
