Rails.application.routes.draw do

   post 'seekers/login', to: 'seekers#login'
   get 'seekers/search/job', to: 'seekers#search_job'
   post 'seekers/apply/job', to: 'seekers#apply_for_job'
   post 'seekers/view/applied/jobs', to: 'seekers#view_applied_jobs'
   resources :seekers

   post 'recruiters/login', to: 'recruiters#login'
   post 'recruiters/create/job', to: 'recruiters#create_jobs'
   post 'recruiters/view/job', to: 'recruiters#view_all_jobs'
   patch 'recruiters/update/job/:id', to: 'recruiters#job_update'
   delete 'recruiters/delete/job/:id', to: 'recruiters#job_delete'

   get 'recruiters/view/applied/jobs', to: 'recruiters#view_applied_jobs'

   patch 'recruiters/approve/applied/jobs', to: 'recruiters#approve_applied_jobs'

   resources :recruiters

   # resources :jobs



  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
