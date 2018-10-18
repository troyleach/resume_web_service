require 'rails_helper'

RSpec.describe AnswersController, type: :controller do
  describe 'GET /answer' do
    it 'it returns an answer' do
      get :get_answer
      expect(response).to have_http_status(:success)
    end
  end
end
