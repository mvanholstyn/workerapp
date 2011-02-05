Workerapp::Application.routes.draw do
  resources :jobs
  resources :tasks do
    match :next
    match :result
  end
  root :to => "jobs#index"  
end
