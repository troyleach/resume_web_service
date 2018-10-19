require 'rails_helper'
include SolvePuzzle

  describe 'Solve Puzzle' do
    let(:string_one) { "Please solve this puzzle:\n ABCD\nA=>--\nB<---\nC-<=-\nD>---\n"  }
    let(:string_two) { "Please solve this puzzle:\n ABCDEF\nA=>--\nB<---\nC-<=-\nD>---\nE->--\nF->--" }

    context 'returns the correct board' do
      it 'it returns an answer' do
        expect(make_board(string_one)).to eq(starting_board_expect_one)
      end
    end

    context 'returns the correct board' do
      it 'it returns an answer' do
        expect(make_board(string_two)).to eq(starting_board_expect_two)
      end
    end
  end


  def starting_board_expect_one
   [
     ["=", ">", "-", "-"],
     ["<", "-", "-", "-"],
     ["-", "<", "=", "-"],
     [">", "-", "-", "-"]
   ]
  end

  def starting_board_expect_two
   [
     "=>--".split(''),
     "<---".split(''),
     "-<=-".split(''),
     ">---".split(''),
     "->--".split(''),
     "->--".split('')
   ]
  end


  def puzzle_solved
    "ABCD\nA=>><\nB<=><\nC<<=<\nD>>>=\n"
  end

#{"q"=>"Puzzle", "d"=>"Please solve this puzzle:\n ABCD\nA=>--\nB<---\nC-<=-\nD>---\n"}
