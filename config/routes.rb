Rails.application.routes.draw do
  get 'furimas/index'
  devise_for :users
  root to: "furimas#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
