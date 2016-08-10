Rails.application.routes.draw do

  resources :surveys do
    resources :questions, only: [:new, :create, :destroy]
    resources :responses
  end

  resources :multi_choices, :single_choices, only: [:new, :create, :show] do
    resources :options
  end

  resources :number_ranges, only: [:new, :create]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
