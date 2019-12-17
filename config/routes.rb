Rails.application.routes.draw do

  root :to => 'tops#about'

  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
    passwords: 'admins/passwords'
  }

  devise_for :users, controllers: {
    sessions: 'publics/sessions',
    passwords: 'publics/passwords',
    registrations: 'publics/registrations'
  }

  namespace :admins do
    # 管理者(ユーザー機能)
    resources :users, only: [:index, :show, :destroy]
    # 管理者(問い合わせ機能)
    resources :inquiries, only: [:index, :show]
    # 管理者(問い合わせ返信機能)
    resources :inquiry_replies, only: [:edit, :update]
    # 管理者(ゲームジャンル追加、削除機能)
    resources :gamegenres, only: [:new, :create, :destroy]
    # 管理者(通報機能)
    resources :reports, only: [:index]
  end

  scope module: :publics do
    # 問い合わせ
    resources :inquiries, only: [:create, :new]
    # DM機能(メッセージ)
    resources :messages, only: [:create, :index]
    # DM機能(ルーム)
    resources :rooms, only: [:index, :create, :show]
    # 投稿機能
    resources :posts, only: [:index, :create, :new, :show, :destroy]
    # 通報機能
    resources :reports, only: [:create, :new]
    # カレンダー
    resources :events, only: [:create, :new, :index, :show, :edit, :update, :destroy]
    # マッチング機能
    resources :relationships, only: [:create]
    patch 'relationships/:id' => 'relationships#block'
    put 'relationships/:id' => 'relationships#block'
    # ユーザー機能
    resources :users, only: [:index, :show, :edit, :update, :destroy]
    get 'users/:id/matchings' => 'users#matching', as: 'matching'
    get 'users/:id/matchings/info' => 'users#info', as: 'info'
    get 'users/:id/edit2' => 'users#edit2', as: 'edit2'
  end

  get 'tops/caution'
  get 'tops/term'
  get 'tops/privacy_policy'
  get 'signin' => 'signin#new', as: 'signin'
  get 'signup' => 'signup#new', as: 'signup'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
