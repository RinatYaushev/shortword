Rails.application.routes.draw do
  scope '(:locale)', locale: /en|ru/ do
    devise_for :users
    resources :posts, except: :index

    root to: 'posts#index'
  end
end
