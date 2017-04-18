class UsersController < ApplicationController
  def index
    render json: User.all
  end

  def create
    user = User.new(params[:user].permit(:username))
    if user.save
      render json: user
    else
      render(
        json: user.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def show
    user = User.find_by(id: params[:id])
    if user
      render json: user
    else
      render(
      #can't do user.errors, as no user was found
        json: ['User not found!'], status: 404
      )
    end
  end

  def update
    user = User.find_by(id: params[:id])
    if user.update_attributes(user_params)
      render json: user
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    user = User.find_by(id: params[:id])
    if user.destroy
      render json: user
    else
      render json: "Can't touch this user"
    end
  end

  private

  def user_params
    params.require(:user).permit(:username)
  end
end
