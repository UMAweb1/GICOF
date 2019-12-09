Rails.application.routes.draw do
  namespace :publics do
    resources :users, only: [:index, :show, :edit, :update, :destroy]
    get 'matchings' => 'users#matching', as: 'matching'
    get 'matchings/info' => 'users#info', as: 'info'
    get 'users/:id/edi2' => 'users#edit2', as: 'edit2'
  end
  root :to => 'tops#about'
  get 'tops/caution'
  get 'tops/term'
  get 'signin' => 'signin#new', as: 'signin'
  get 'signup' => 'signup#new', as: 'signup'
  get 'tops/privacy_policy'
  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
    passwords: 'admins/passwords'
  }
  devise_for :users, controllers: {
    sessions: 'publics/sessions',
    passwords: 'publics/passwords',
    registrations: 'publics/registrations'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
