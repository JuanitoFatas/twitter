require "oath/constraints/signed_in"

Rails.application.routes.draw do
  constraints Oath::Constraints::SignedIn.new do
    root "dashboards#show", as: :dashboard
  end

  root "homes#show"

  post "text_tweets" => "tweets#create", defaults: { content_type: TextTweet }
  post "photo_tweets" => "tweets#create", defaults: { content_type: PhotoTweet }

  resources :tweets, only: [:show] do
    member do
      post "like" => "likes#create"
      delete "unlike" => "likes#destroy"
    end
  end

  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show] do
    resources :followers, only: :index

    member do
      post "follow" => "followed_users#create"
      delete "follow" => "followed_users#destroy"
    end
  end
end
