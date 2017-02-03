class Api::V1::UsersController < ApplicationController

  skip_before_action :verify_authenticity_token
  before_action :set_user, only: [:show, :update, :destroy]
  before_action :authorize_request, only: [:show, :update, :destroy] # Check auth token before actions

  # GET /users
  def index
    respond_to do |format|
      format.all { render json: User.all}
      format.xml { render xml: User.all}
    end
  end

  # GET /users/1
  def show
    respond_to do |format|
      format.all { render json: @user}
      format.xml { render xml: @user}
    end
  end

  # POST /users
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.all {render json: @user, status: :created}
        #format.html { redirect_to @user, notice: 'Prueba was successfully created.' }
        #format.all { render :show, status: :created, location: @user }
        #format.xml { render :show, status: :created, location: @user }
      else
        #format.html { render :new }
        #format.all { render json: @user.errors, status: :unprocessable_entity }
        #format.xml { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  def update
    respond_to do |format|
      if @user.update(user_params)
        #format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.all { render :show, status: :ok, location: @user }
        format.xml { render :show, status: :ok, location: @user }
      else
        #format.html { render :edit }
        format.all { render json: @user.errors, status: :unprocessable_entity }
        format.xml { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
    respond_to do |format|
      #format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.all { head :no_content }
      format.xml { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:email, :username, :pass)
  end

end
