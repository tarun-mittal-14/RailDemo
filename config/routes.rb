# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  # post 'seekers/login', to: 'seekers#login'
  get 'seekers/search/job', to: 'seekers#search_job'
  get 'seekers/view/job', to: 'seekers#view_jobs'
  post 'seekers/apply/job/:id', to: 'seekers#apply_for_job'
  get 'seekers/view/applied/jobs', to: 'seekers#view_applied_jobs'

  resource :seekers

  post 'users/login', to: 'users#login'
  # post 'recruiters/login', to: 'recruiters#login'
  resource :recruiters

  post 'jobs/create/job', to: 'jobs#create_jobs'
  post 'jobs/view/job', to: 'jobs#view_all_jobs'
  # put 'jobs/update/job/:id', to: 'jobs#job_update'
  delete 'jobs/delete/job/:id', to: 'jobs#job_delete'
  get 'jobs/view/job/applications', to: 'jobs#view_job_applications'
  patch 'jobs/approve/job/applications', to: 'jobs#approve_job_applications'
  get 'jobs/view/approved/job/applications', to: 'jobs#view_approved_job_applications'
  patch 'jobs/reject/job/applications', to: 'jobs#reject_job_applications'
  get 'jobs/view/rejected/job/applications', to: 'jobs#view_rejected_job_applications'

  resources :jobs

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
