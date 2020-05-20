Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }

  root to: "posts#index"
  resources :posts, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
    resources :post_comments, only: [:create, :destroy]
  end

  get  "posts/:id/post_comments"  => "post_comments#create", defaults: { format: 'json' }

end