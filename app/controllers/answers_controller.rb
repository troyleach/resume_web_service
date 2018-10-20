class AnswersController < ApplicationController
  include SolvePuzzle

  def get_answer
    if params['q'] == 'Puzzle'
      result = solve_puzzle(params['d'])
    else
      result = troy_leach_resume[params["q"]]
    end

    render body: result
  end

  private

  def troy_leach_resume
    {
      "Ping" => "OK",
      "Name" => "Troy Wade Leach",
      "Email Address" => "troyleach@outlook.com",
      "Phone" => "720-552-0720",
      "Position" => "Senior Full Stack Engineer",
      "Years" => "4 Years of experience",
      "Referrer" => "https://angel.co/",
      "Degree" => "RoR Web Development, Actualize, HTML and Web Development, Colorado Free University",
      "Resume" => "https://www.google.com",
      "Source" => "https://www.google.com",
      "Status" => "Yes"
    }
  end
end
