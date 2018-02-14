class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:current_user_id] = @user.id
      redirect_to root_url
    else
      render 'new'
    end
  end

  def show
    @current_user = User.find_by_id(session[:current_user_id])
    @events = @current_user.events.paginate(:page => params[:page])
  end

  private

    def user_params
      params.require(:user).permit(:name)
    end
end
