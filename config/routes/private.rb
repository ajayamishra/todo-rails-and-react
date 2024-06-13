# frozen_string_literal: true

scope :p, module: :private do
  resources :projects, only: [:index, :show, :create, :update, :delete]
  resources :tasks, only: [:index, :show, :create, :update, :delete]
  resources :tags, only: [:index, :show, :create, :update, :delete]
  resources :users, only: [:index, :show, :create, :update, :delete]
end