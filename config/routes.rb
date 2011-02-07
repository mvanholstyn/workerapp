Workerapp::Application.routes.draw do
  resources :jobs
  resources :tasks do
    match :next
    match :result
  end
  resources :test
  root :to => "jobs#index"  
end
