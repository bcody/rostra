Rails.application.routes.draw do

  devise_for :users

  root :to => "static#index"

  mount Rostra::Engine => "/rostra"
end
