require "oath/constraints/signed_in"

Rails.application.routes.draw do
  constraints Oath::Constraints::SignedIn.new do
    root "dashboards#show", as: :dashboard
  end

  root "homes#show"

  resources :tweets, only: [:create, :show] do
    member do
      post "like" => "likes#create"
      delete "unlike" => "likes#destroy"
    end
  end

  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show]
end
