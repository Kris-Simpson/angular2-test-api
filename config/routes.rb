Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :todos, except: %i(new show)
    end
  end
end
