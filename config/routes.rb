Rails.application.routes.draw do
  scope '(:locale)', locale: /en|ru/ do
    devise_for :users
    resources :posts, except: :index do
      get :like, to: 'votes#like', as: :like
      get :dislike, to: 'votes#dislike', as: :dislike
    end

    root to: 'posts#index'
  end
end
