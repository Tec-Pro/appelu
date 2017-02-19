class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #protect_from_forgery with: :exception

def authenticate
  	token_str = request.headers["X-AUTH-TOKEN"]
  	@token = Token.find_by(token: token_str)
    
  	if @token.nil? or not @token.is_valid? 
      error!("Tu token es inválido", :unauthorized)
  	else
  		@current_user = @token.user
      @user = @current_user
  	end
end

def error!(message,status)
    @errors = message
    response.status = status
    render template: "api/v1/errors"
end

def error_array!(array,status)
    @errors = @errors + array
    response.status = status
    render "api/v1/errors"
  end

  def authenticate_owner(owner)
    if owner != @current_user
      error!("No tienes autorizado editar este recurso", :unauthorized)
    end
  end

end

#dcedcc7531cf05332840d2eccfa241a4