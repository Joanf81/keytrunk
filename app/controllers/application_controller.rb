class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def authorize_request
    @current_user = Authorization.authorize_token(request.headers)
    if @current_user.nil?
      render json: { error: 'Not Authorized' }, status: 401
    end

  end
end
