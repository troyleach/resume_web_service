require 'rails_helper'
include SolvePuzzle

describe 'Solve Puzzle' do
  let(:string_one) { "Please solve this puzzle:\n ABCD\nA=>--\nB<---\nC-<=-\nD>---\n"  }
  let(:string_two) { "Please solve this puzzle:\n ABCDEF\nA=>--\nB<---\nC-<=-\nD>---\nE->--\nF->--" }
  let(:string_three) {"Please solve this puzzle:\n ABCD\nA=->-\nB>---\nC<-=-\nD--<-\n"}
  let(:string_four) {"Please solve this puzzle:\n ABCD\nA=-<-\nB--->\nC---<\nD-->-\n"}
  let(:string_five) {"Please solve this puzzle:\n ABCD\nA-<--\nB>---\nC<-=-\nD->-=\n"}
  let(:string_six) {"Please solve this puzzle:\n ABCD\nA=->-\nB>---\nC<-=-\nD--<-\n"}

  #let(:passing_string_per_emx_two) {"Please solve this puzzle:\n ABCD\nA->--\nB-->-\nC-<=-\nD--<-\n"}
  #{"q"=>"Puzzle", "d"=>"Please solve this puzzle:\n ABCD\nA=--<\nB-=->\nC<---\nD>---\n"}

  let(:passing_string_zero) {"Please solve this puzzle:\n ABCD\nA=--<\nB-=->\nC<---\nD>---\n"}
  #top on screen
  expect_zero = [
    ["=", "<", "<", "<"],
    [">", "=", "<", ">"],
    ["<", ">", "=", "<"],
    [">", ">", ">", "="]
  ]
  let(:failing_string_one) {"Please solve this puzzle:\n ABCD\nA---<\nB--->\nC<-=-\nD>--=\n"}
  expect_one = [
    ["=", "<", ">", "<"],
    [">", "=", ">", ">"],
    ["<", "<", "=", "<"],
    [">", "<", ">", "="]
  ]

  let(:expect_two_string) {"Please solve this puzzle:\n ABCD\nA->--\nB-->-\nC-<=-\nD--<-\n"}
  expect_two = [["=", ">", "<", "<"], [">", "=", ">", "<"], [">", "<", "=", "<"], [">", ">", "<", "="]]

  # this one fails on emx same as below the way i populate the board end wtih =
  let(:expect_three_string) {"Please solve this puzzle:\n ABCD\nA->--\nB-->-\nC-<=-\nD--<=\n"}
  expect_three = [
    ["=", ">", ">", ">"],
    ["<", "=", ">", ">"],
    ["<", "<", "=", ">"],
    ["<", "<", "<", "="]
  ]

  # Please solve this puzzle: ABCD A---< B---> C<--- D>--= fail
  let(:expect_four_string) {"Please solve this puzzle:\n ABCD\nA->--\nB-->-\nC-<=-\nD--<-\n"}
  expect_four = [
    ["=", "<", ">", "<"],
    [">", "=", ">", ">"],
    ["<", "<", "=", "<"],
    [">", "<", ">", "="]
  ]

  # Please solve this puzzle: ABCD A=--< B-=-> C<--- D>--- pass
  # Please solve this puzzle: ABCD A->-- B-->- C-<=- D--<- pass
  # Please solve this puzzle: ABCD A->-- B-->- C-<=- D--<= fail

  context 'Puzzle' do
    xit 'troys method passes on EMX' do
      # FALSE POSITIVE
      # Please solve this puzzle: ABCD A=--< B-=-> C<--- D>--- pass
      expect(solve_puzzle(passing_string_zero)).to eq(expect_zero)
    end
  end

  context 'Puzzle' do
    xit 'troys method fails on EMX' do
      # Please solve this puzzle: ABCD A---< B---> C<-=- D>--= fail
      #puzzle = Puzzle.new(failing_string_one)
      expect(solve(failing_string_one)).to eq(expect_one)
    end
  end

  context 'Puzzle' do
    #GOOD
    xit 'troys method passes on EMX' do
      # Please solve this puzzle: ABCD A->-- B-->- C-<=- D--<- pass
      expect(solve(expect_two_string)).to eq(expect_two)
    end
  end

  context 'Puzzle' do
    #GOOD
    xit 'this one fails on EMX' do
      # Please solve this puzzle: ABCD A->-- B-->- C-<=- D--<= fail
      expect(solve(expect_three_string)).to eq(expect_three)
    end
  end

  context 'Puzzle' do
    #not sure this right
    xit 'this one fails on EMX' do
      # Please solve this puzzle: ABCD A---< B---> C<--- D>--= fail
      expect(solve(expect_four_string)).to eq(expect_four)
    end
  end





  # NOTES old tests below
  context 'passes test per EMX service' do
    xit 'returns positive resutl' do
      let(:failing_string_per_emx) {"Please solve this puzzle:\n ABCD\nA---<\nB--->\nC<-=-\nD>--=\n"}
      emx_expect = [
        ["=", "<", ">", "<"],
        [">", "=", ">", ">"],
        ["<", "<", "=", "<"],
        [">", "<", ">", "="]
      ]
      expect(solve_puzzle(failing_string_per_emx)).to eq([])
    end
  end

  context 'returns the correct board' do
    xit 'it returns an answer' do
      expect(make_board(string_one)).to eq(starting_board_expect_one)
    end
  end

  context 'returns the correct board' do
    xit 'it returns an answer' do
      expect(make_board(string_two)).to eq(starting_board_expect_two)
    end
  end

  context 'returns the correct board' do
    xit 'solves the puzzle one' do
      starting_board = make_board(string_one)
      expect(solve(starting_board)).to eq(finished_board_expectation)
    end
  end

  context 'returns the correct board' do
    xit 'solves the puzzle three' do
      #{"q"=>"Puzzle", "d"=>"Please solve this puzzle:\n ABCD\nA=->-\nB>---\nC<-=-\nD--<-\n"}
      expectation_three = [
        ["=", "<", ">", ">"],
        [">", "=", ">", ">"],
        ["<", "<", "=", ">"],
        ["<", "<", "<", "="]
      ]
      starting_board = make_board(string_three)
      p starting_board
      p solve(starting_board)
      p expectation_three
      puts ' -' * 50
      #expect(solve(starting_board)).to eq(expectation_three)
    end
  end

  context 'returns the correct board' do
    xit 'solves the puzzle four' do
      #{"q"=>"Puzzle", "d"=>"Please solve this puzzle:\n ABCD\nA=-<-\nB--->\nC---<\nD-->-\n"}
      expectation_four = [
        ["=", "<", "<", "<"],
        [">", "=", ">", ">"],
        [">", "<", "=", "<"],
        [">", "<", ">", "="]
      ]
      expect(solve(starting_board)).to eq(expectation_four)
    end
  end
  context 'returns the correct board' do
    xit 'solves the puzzle five' do
      #{"q"=>"Puzzle", "d"=>"Please solve this puzzle:\n ABCD\nA-<--\nB>---\nC<-=-\nD->-=\n"}
      #c on this one is the same as c on the right above
      expectation_five = [
        ["=", "<", ">", "<"],
        [">", "=", ">", "<"],
        [">", "<", "=", "<"],
        [">", "<", ">", "="]
      ]
      starting_board = make_board(string_five)
      p starting_board
      p solve(starting_board)
      p expectation_five
      puts ' -' * 50
      #expect(solve(starting_board)).to eq(expectation_five)
    end
  end
  context 'returns the correct board' do
    xit 'solves the puzzle six' do
      #{"q"=>"Puzzle", "d"=>"Please solve this puzzle:\n ABCD\nA=->-\nB>---\nC<-=-\nD--<-\n"}
      expectation_three = [
        ["=", "<", ">", ">"],
        [">", "=", ">", ">"],
        ["<", "<", "=", ">"],
        ["<", "<", "<", "="]
      ]
      expectation_four = [
        ["=", "<", "<", "<"],
        [">", "=", ">", ">"],
        [">", "<", "=", "<"],
        [">", "<", ">", "="]
      ]
      expectation_five = [
        ["=", "<", ">", "<"],
        [">", "=", ">", "<"],
        [">", "<", "=", "<"],
        [">", "<", ">", "="]
      ]
      expectation_six = [
        ["=", "<", ">", ">"],
        [">", "=", ">", ">"],
        ["<", "<", "=", ">"],
        ["<", "<", "<", "="]
      ]

      p 'expects'
      p expectation_three
      p expectation_four
      p expectation_five
      p expectation_six

      starting_board = make_board(string_three)
      p starting_board
      p solve(starting_board)
      p expectation_three
      puts ' -' * 50

      starting_board = make_board(string_four)
      p starting_board
      p solve(starting_board)
      p expectation_four
      puts ' -' * 50

      starting_board = make_board(string_five)
      p starting_board
      p solve(starting_board)
      p expectation_five
      puts ' -' * 50

      starting_board = make_board(string_six)
      p starting_board
      p solve(starting_board)
      p expectation_six
      puts ' -' * 50
      #expect(solve(starting_board)).to eq(expectation_six)
    end
  end

  context 'solved puzzle' do
    it 'returns a formated string' do
      expect(format_string(finished_board_expectation)).to eq(solved_puzzle_string)
    end
  end

  #below are just case tests to see stuff
  context 'Puzzle' do
    xit 'this is the two puzzle strings' do
      starting_board_one = make_board(passing_string_per_emx)
      #p starting_board_one
      #passing_boaard_one = solve(starting_board_one)
      #p passing_string_per_emx_expect
      #puts ' -' * 50

      starting_board_two = make_board(failing_string_per_emx)
      #p starting_board_two
      #passing_boaard_two = solve(starting_board_two)
      #p failing_string_per_emx_expect
      #puts ' -' * 50
      p 'This is the two puzzle strings top one passes bottom one does not'
      p starting_board_one
      p starting_board_two
      puts ' -' * 50
      #p passing_boaard_one
      #p failing_string_per_emx_expect
    end
  end

  context 'Puzzle' do
    xit 'this is the two puzzle strings' do
      #starting_board_one = make_board(passing_string_per_emx)
      starting_board_two = make_board(passing_string_per_emx)
      #p starting_board_one
      passing_boaard_two = solve(starting_board_two)
      #p passing_string_per_emx_expect
      #puts ' -' * 50

      #p starting_board_two
      #passing_boaard_two = solve(starting_board_two)
      #p failing_string_per_emx_expect
      #puts ' -' * 50
      p 'These are the two solved puzzle from my service Bottom one from EMX'
      p starting_board_two
      #p emx_expect
    end
  end
end


def starting_board_expect_one
  #{"q"=>"Puzzle", "d"=>"Please solve this puzzle:\n ABCD\nA=>--\nB<---\nC-<=-\nD>---\n"}
  [
    ["=", ">", "-", "-"],
    ["<", "-", "-", "-"],
    ["-", "<", "=", "-"],
    [">", "-", "-", "-"]
  ]
end

def starting_board_expect_two
  #{"q"=>"Puzzle", "d"=>"Please solve this puzzle:\n ABCD\nA=>--\nB<---\nC-<=-\nD>---\n"}
  [
    "=>--".split(''),
    "<---".split(''),
    "-<=-".split(''),
    ">---".split(''),
    "->--".split(''),
    "->--".split('')
  ]
end

def finished_board_expectation
  [
    ["=", ">", ">", "<"],
    ["<", "=", ">", "<"],
    ["<", "<", "=", "<"],
    [">", ">", ">", "="]
  ]
end

def solved_puzzle_string
  #{"q"=>"Puzzle", "d"=>"Please solve this puzzle:\n ABCD\nA=>--\nB<---\nC-<=-\nD>---\n"}
  "ABCD\nA=>><\nB<=><\nC<<=<\nD>>>=\n"
end

#Please solve this puzzle: ABCD A=--< B-=-> C<--- D>---
#A=<<< B>=<> C<>=< D>>>=

#is the same as this per my method
#Please solve this puzzle: ABCD A---< B---> C<-=- D>--=
#A=<>< B>=>> C<<=< D><>=


#Please solve this puzzle: ABCD A->-- B-->- C-<=- D--<-
#A=><< B>=>< C><=< D>><=

#Please solve this puzzle: ABCD A->-- B-->- C-<=- D--<= 
#A=>>> B<=>> C<<=> D<<<=

#Please solve this puzzle: ABCD A->-- B-->- C-<=- D--<-
#Please solve this puzzle: ABCD A->-- B-->- C-<=- D--<=
#A=>>> B<=>> C<<=> D<<<=

#B-->-
#B<=>>

#B-->-
#B>=>>



#Please solve this puzzle: ABCD A=-<- B-->- C>--- D<---
#
#
#
#
#Please solve this puzzle: ABCD A--<- B-=>- C>--- D<--=
#Please solve this puzzle: ABCD A=-<- B-->- C>--- D<--=
#Please solve this puzzle: ABCD A=-<- B-->- C>-=- D<--=
#A=<<> B>=>> C><=> D<<<=
