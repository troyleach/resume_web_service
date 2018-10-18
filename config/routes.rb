Rails.application.routes.draw do
  get 'answer', to: 'answers#get_answer', as: 'get_answer'
end
