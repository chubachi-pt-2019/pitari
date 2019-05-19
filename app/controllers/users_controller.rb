class UsersController < ApplicationController
  def new
    if session[:user_id]
      @discuss = Discuss.find(params[:discuss_id])
      redirect_to @discuss
    else 
      @user = User.new
      @user.discuss_id = params[:discuss_id]
    end
  end

  def create
    @user = User.new
    @user.discuss_id = user_params["discuss_id"]
    @user.name = user_params["name"]
    @user.active = true
    @discuss = Discuss.find(@user.discuss_id)
    if session[:user_id]
      redirect_to @discuss
    elsif @user.save
      session[:user_id] = @user.id
      redirect_to @discuss
    else
      flash.now[:danger] = @user.errors.full_messages
      render 'new'
    end
  end

    private
  
    def user_params
      params.require(:user).permit(:name, :discuss_id)
    end
    
end
