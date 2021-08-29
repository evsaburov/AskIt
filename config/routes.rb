Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # get '/questions', to: 'questions#index'
  # get '/questions/new', to: 'questions#new'
  # get '/questions/:id/edit', to: 'questions#edit'
  # post '/questions', to: 'questions#create'

  # resources :questions, only: %i[index new edit create update destroy show]
  resources :questions do
    resources :answers, exept: %i[new show]
  end
  
  root 'pages#index'
end
 