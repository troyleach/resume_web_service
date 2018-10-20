class AnswersController < ApplicationController
  include SolvePuzzle

  def get_answer
    list_of_keys_and_answers = {
      "Ping" => "OK",
      "Name" => "Troy Wade Leach",
      "Email Address" => "troyleach@outlook.com",
      "Status" => "Yes"
    }

    if params['q'] == 'Puzzle'
      result = solve_puzzle(params['d'])
    else
      result = list_of_keys_and_answers[params["q"]]
    end

    render body: result
  end
end
