Rails.application.routes.draw do

   namespace :api do

      namespace :v1 do

         resources :articles
         resources :sessions, only: [:create]

      end

   end

end
