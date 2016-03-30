require "sidekiq/web"
Rails.application.routes.draw do

  devise_for :users
  root "static_pages#home"
  get "help" => "static_pages#help"
  resources :courses
  resources :user_subjects, only: [:update]

  namespace :admin do
    root "subjects#index"
    resources :subjects
    resources :courses do
      resource :user_courses
      resource :course_subjects, only: [:update]
      collection {post :search, to: "courses#index"}
    end
  end
  mount Sidekiq::Web, at: "/sidekiq"
end
