require 'rails_helper'

RSpec.describe AnswersController, type: :controller do
  describe 'GET /answer' do
    context 'making sure 200' do
      it 'it returns an answer' do
        get :get_answer
        expect(response).to have_http_status(:success)
      end
    end

    context 'returns "ok"' do
      it 'returns the string OK' do
        params = {"q"=>"Ping",
                  "d"=>"Please return OK so that I know your service works."}
        get :get_answer, params: params
        expect(response.body).to eq('OK')
      end
    end

    context 'returns "Link to the source code"' do
      xit 'returns the string OK' do
        params = {"q"=>"Source",
                  "d"=>"Please provide a URL where we can download the source code of your resume submission web service."}
        get :get_answer, params: params
        expect(response.body).to eq('OK')
      end
    end

    context 'returns Full Name' do
      it 'returns the string OK' do
        params = {"q"=>"Name",
                  "d"=>"What is your full name?"}
        get :get_answer, params: params
        expect(response.body).to eq('Troy Wade Leach')
      end
    end

    context 'returns Status' do
      it 'returns the string OK' do
        params = {"q"=>"Status",
                  "d"=>"Can you provide proof of eligibility to work in the US?"}
        get :get_answer, params: params
        expect(response.body).to eq('Yes')
      end
    end
  end
end
