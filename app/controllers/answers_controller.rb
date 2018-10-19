class AnswersController < ApplicationController
  def get_answer
    list_of_questions_and_keys = {
      "Ping" => "OK",
      "Name" => "Troy Wade Leach",
      "Status" => "Yes"
    }
    result = list_of_questions_and_keys[params["q"]]
    render body: result
  end
end
