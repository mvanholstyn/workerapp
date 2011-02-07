Workerapp::Application.routes.draw do
  resources :jobs
  resources :test
  # resources :tasks do
  #   match :next
  #   match :result
  # end
  get "tasks/next" => "tasks#next"
  get "tasks/result" => "tasks#result"

  root :to => "jobs#index"  
end
