class SubsController < ApplicationController
  before_action :require_login
  #before_action :is_moderator?, only: [:edit, :update]
  def new
    @sub = Sub.new
  end

  def create
    @sub = Sub.new(sub_params)
    @sub.user_id = current_user.id
    if @sub.save
      redirect_to sub_url(@sub)
    else
      flash[:errors] = @sub.errors.full_messages
      render :new
    end
  end

  def show
    @sub = Sub.find(params[:id])
  end

  def index
    @subs = Sub.all
  end

  def edit
    @sub = Sub.find(params[:id])
  end

  def update
    @sub = Sub.find(params[:id])
    if @sub.update_attributes(sub_params)
      redirect_to sub_url(@sub)
    else
      flash[:errors] = @sub.errors.full_messages
      render :edit
    end
  end

  def is_moderator?
    return if current_user.subs.find_by(id: params[:id])
    render subs_url
  end

  def sub_params
    params.require(:sub).permit(:title, :description)
  end
end
