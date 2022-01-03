class UsersController < ApplicationController
  # before_action :authorized, only: [:check_login]

  # SIGN UP
  def create
    @user = User.new(user_params)
    if @user.save
      token = encode_token({ user_id: @user.id })
      render json: { user: @user, token: token }, status: :created
    else
      render json: { error: @user.errors }, status: :unprocessable_entity
    end
  end

  # SIGN IN
  def login
    if @user = User.authenticate(user_params[:email], user_params[:password])
      token = encode_token({ user_id: @user.id })
      render json: { user: @user, token: token }, status: :created
    else
      render json: { error: 'Invalid credentials' },
      status: :unauthorized
    end
  end

  # def check_login
  #   render json: @user
  # end

private

  def user_params
    params.permit(:full_name, :email, :password)
  end
end
