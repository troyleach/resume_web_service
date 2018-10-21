# NOTE: goes with out saying that a user ID of some sort would have to be past in 
# the params

class AnswersController < ApplicationController
  include SolvePuzzle
  before_action :get_user

  def get_answer
    return if params.nil? || params['q'].nil?
    ping? ? result = 'OK' : nil

    query = params['q'].downcase
    question = params['d']

    unless result.present?
      if query == 'puzzle'
        result = solve_puzzle(question)
      else
        result = @user.resume[query]
      end
    end

    render body: result
  end

  private

  def get_user
    @user = User.first
  end

  def ping?
    params['q'] == 'Ping'
  end
end
