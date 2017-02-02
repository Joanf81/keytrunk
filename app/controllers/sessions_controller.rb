class SessionsController < ApplicationController

  skip_before_action :verify_authenticity_token

  def create
    user = User.find_by(email: auth_params[:email])

    if user.authenticate(auth_params[:pass])
      jwt = Auth.issue({user: user.id}) # Create a jwt
      render json: {jwt: jwt}

    else
      render json: {error: 'Authentification failure'}
    end
  end

  private
  def auth_params
    params.require(:session).permit(:email, :pass)
  end
end
