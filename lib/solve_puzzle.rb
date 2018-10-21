module SolvePuzzle
  def solve_puzzle(string)
    board = make_board(string)
    # When things are figured out uncomment this
    #format_string(solve(board))
    #and delete this
    solve(board)
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
      if row_array.count('-') > 1
        (row_array.length - 1).times do |cell|
          if row_array[cell] > row_array[cell+1]
            row_array[cell] = "<"
          elsif row_array[cell] < row_array[cell+1]
            row_array[cell] = ">"
          else next
          end
        end
      end
      #row_array.each_with_index do |cell, column_index|
      #row_array.each do |cell|
      #[A]>[B] || [A]<[B]
      #puts row_array


      #puts "[#{cell}] and the one to the right [#{cell.next}]"
      #puts cell < cell.next


      #end
    end
    #print_new_board(starting_board)
    starting_board.first
  end

  def print_new_board(board)
    board.each_with_index do |row_array, row_index|
      row_array.each_with_index do |cell, column_index|
        #puts "#{row_array[cell]} and it partner to the right #{row_array[cell+1]}"
        #puts row_array[cell] > row_array[cell+1]
        puts "cell: #{cell}   #{row_array}}"
      end
    end
  end
end

#below did not work

        #if cell == "="
          #next 
        #elsif cell == ">" || cell == "<"
          #next 
        #else
          ##row_index < column_index ? row_array[column_index] = ">" : row_array[column_index] = "<"
          #if row_index == column_index
            #row_array[column_index] = "="
          #else
            ##puts "row_index: #{row_index} : column_index: #{column_index}"
            #row_index > column_index ? row_array[column_index] = ">" : row_array[column_index] = "<"
          #end
        #end
