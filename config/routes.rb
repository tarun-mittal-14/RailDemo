# frozen_string_literal: true

Rails.application.routes.draw do
  # post 'seekers/login', to: 'seekers#login'
  get 'seekers/search/job', to: 'seekers#search_job'
  get 'seekers/view/job', to: 'seekers#view_jobs'
  post 'seekers/apply/job', to: 'seekers#apply_for_job'
  get 'seekers/view/applied/jobs', to: 'seekers#view_applied_jobs'

  resources :seekers

  post 'users/login', to: 'users#login'
  # post 'recruiters/login', to: 'recruiters#login'
  resources :recruiters

  post 'jobs/create/job', to: 'jobs#create_jobs'
  post 'jobs/view/job', to: 'jobs#view_all_jobs'
  patch 'jobs/update/job/:id', to: 'jobs#job_update'
  delete 'jobs/delete/job/:id', to: 'jobs#job_delete'
  get 'jobs/view/applied/jobs', to: 'jobs#view_applied_jobs'
  patch 'jobs/approve/applied/jobs', to: 'jobs#approve_applied_jobs'
  get 'jobs/view/approved/jobs', to: 'jobs#view_approved_jobs'
  patch 'jobs/reject/applied/jobs', to: 'jobs#reject_applied_jobs'
  get 'jobs/view/rejected/jobs', to: 'jobs#view_rejected_jobs'

  # resources :jobs

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
