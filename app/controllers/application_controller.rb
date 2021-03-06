class ApplicationController < ActionController::Base
	skip_before_action :verify_authenticity_token

	def cors_set_access_control_headers
	    headers['Access-Control-Allow-Origin'] = '*'
	    headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, OPTIONS'
	    headers['Access-Control-Request-Method'] = '*'
		headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
	end
	
	def set_cors_header
	    headers['Access-Control-Allow-Origin'] = '*'
	    headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, OPTIONS'
	    headers['Access-Control-Request-Method'] = '*'
	    headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Typee, Accept, Authorization'
  	end
end
