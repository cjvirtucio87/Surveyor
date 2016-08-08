Rails.application.routes.draw do

  resources :surveys do
    resources :questions
  end

  resources :multi_choices, :single_choices do
    resources :options
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
