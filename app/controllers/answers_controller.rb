class AnswersController < ApplicationController
  def get_answer
    list_of_questions_and_keys = {
      "Ping" => "OK",
      "Name" => "Troy Wade Leach",
      "Email Address" => "troyleach@outlook.com",
      "Status" => "Yes"
    }
    #if params["q"] == 'Puzzle'
     #return result = 'ABCD\nA=>><\nB<=><\nC<<=<\nD>>>=\n'
    #end

    result = list_of_questions_and_keys[params["q"]]
    render body: result
  end
end
