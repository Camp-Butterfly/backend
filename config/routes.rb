Rails.application.routes.draw do
	namespace :api do
		namespace :v1 do
		# denotes REST actions for images and butterflies
        	resources :images, only: [:index, :new, :create, :destroy, :update]
        	resources :butterflies, only: [:index, :create, :destroy, :update]
    	end
	end
end
