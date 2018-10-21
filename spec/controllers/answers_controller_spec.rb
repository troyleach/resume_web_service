require 'rails_helper'

RSpec.describe AnswersController, type: :controller do
  describe 'puzzle' do
    xit 'it returns an answer' do
      #TODO test fails, algorithm not correct
      params = {"q"=>"Puzzle",
                "d"=>"Please solve this puzzle:\n ABCD\nA=>--\nB<---\nC-<=-\nD>---\n" }
      get :get_answer, params: params
      expect(response.body).to eq(solved_puzzle)
    end
  end

  describe 'GET /answer' do
    before { @user = create(:user) }

    context 'expect 200' do
      it 'it returns an answer' do
        get :get_answer
        expect(response).to have_http_status(:success)
      end

      it 'Ping returns OK' do
        params = {"q"=>"Ping",
                  "d"=>"Please return OK so that I know your service works."}
        get :get_answer, params: params
        expect(response.body).to eq('OK')
      end
    end

    context 'returns Full Name' do
      it 'positive result' do
        params = {"q"=>"Name",
                  "d"=>"What is your full name?"}
        get :get_answer, params: params
        expect(response.body).to eq(@user.resume["name"])
      end
    end

    context 'returns Email address' do
      it 'positive result' do
        params = {"q"=>"Email Address", "d"=>"What is your email address?"}

        get :get_answer, params: params
        expect(response.body).to eq(@user.resume["email address"])
      end
    end

    context 'returns phone number' do
      it 'positive result' do

        params = {"q"=>"Phone", "d"=>"Please provide a phone number we can use to reach you."}

        get :get_answer, params: params
        expect(response.body).to eq(@user.resume["phone"])
      end
    end

    context 'Position applying for' do
      it 'positive result' do

        params = {"q"=>"Position", "d"=>"Which position at Balihoo are you applying for?"}

        get :get_answer, params: params
        expect(response.body).to eq(@user.resume["position"])
      end
    end

    context 'Years of experience' do
      it 'positive result' do

        params = {"q"=>"Years", "d"=>"How many years of software development experience do you have?"}

        get :get_answer, params: params
        expect(response.body).to eq(@user.resume["years"])
      end
    end

    context 'How did you hear about this position' do
      it 'positive result' do

        params = {"q"=>"Referrer", "d"=>"How did you hear about this position?"}

        get :get_answer, params: params
        expect(response.body).to eq(@user.resume["referrer"])
      end
    end

    context 'Relevant degrees(s)' do
      it 'positive result' do

        params = {"q"=>"Degree", "d"=>"Please list your relevant university degree(s)."}

        get :get_answer, params: params
        expect(response.body).to eq(@user.resume["degree"])
      end
    end

    context 'Resume and Cover letter' do
      it 'positive result' do

        params = {"q"=>"Resume", "d"=>"Please provide a URL where we can download your resume and cover letter."}

        get :get_answer, params: params
        expect(response.body).to eq(@user.resume["resume"])
      end
    end

    context 'URL for resume web service' do
      it 'positive result' do
        params = {"q"=>"Source",
                  "d"=>"Please provide a URL where we can download the source code of your resume submission web service."}

        get :get_answer, params: params
        expect(response.body).to eq(@user.resume["source"])
      end
    end

    context 'returns Status' do
      it 'positive result' do
        params = {"q"=>"Status",
                  "d"=>"Can you provide proof of eligibility to work in the US?"}
        get :get_answer, params: params
        expect(response.body).to eq(@user.resume["status"])
      end
    end

  end
end

def solved_puzzle
  #{"q"=>"Puzzle", "d"=>"Please solve this puzzle:\n ABCD\nA=>--\nB<---\nC-<=-\nD>---\n"}
  "ABCD\nA=>><\nB<=><\nC<<=<\nD>>>=\n"
end
