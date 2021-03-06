Rails.application.routes.draw do
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end
  post "/graphql", to: "graphql#execute"
	namespace :api do
		namespace :v1 do
		# defines REST actions for images and butterflies
    # =>  GET, index
    # =>  POST, create
    # =>  DELETE, destroy
    # =>  PUT, update
        	resources :images, only: [:index, :create, :destroy, :update]
        	resources :butterflies, only: [:index, :create, :destroy, :update]
    	end
	end
end
