Rails.application.routes.draw do
  controller :locale do
    post :change, as: :change_locale
  end

  scope '(:locale)', locale: /en|ru/ do
    devise_for :users

    concern :likeable do
      get :like, to: 'votes#like', as: :like
      get :dislike, to: 'votes#dislike', as: :dislike
    end

    resources :posts, except: :index do
      concerns :likeable

      resources :comments
    end

    root to: 'posts#index'
  end
end
