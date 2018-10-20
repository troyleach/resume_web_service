require 'rails_helper'
include SolvePuzzle

describe 'Solve Puzzle' do
  let(:string_one) { "Please solve this puzzle:\n ABCD\nA=>--\nB<---\nC-<=-\nD>---\n"  }
  let(:string_two) { "Please solve this puzzle:\n ABCDEF\nA=>--\nB<---\nC-<=-\nD>---\nE->--\nF->--" }
  let(:string_three) {"Please solve this puzzle:\n ABCD\nA=->-\nB>---\nC<-=-\nD--<-\n"}
  let(:string_four) {"Please solve this puzzle:\n ABCD\nA=-<-\nB--->\nC---<\nD-->-\n"}
  let(:string_five) {"Please solve this puzzle:\n ABCD\nA-<--\nB>---\nC<-=-\nD->-=\n"}
  let(:string_six) {"Please solve this puzzle:\n ABCD\nA=->-\nB>---\nC<-=-\nD--<-\n"}

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
      starting_board = make_board(string_four)
      p starting_board
      p solve(starting_board)
      p expectation_four
      puts ' -' * 50
      #expect(solve(starting_board)).to eq(expectation_four)
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

