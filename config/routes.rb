Workerapp::Application.routes.draw do
  root :to => "workers#index"
  match "workers/next.json" => "workers#next"
  match "workers/result.json" => "workers#result"
end
