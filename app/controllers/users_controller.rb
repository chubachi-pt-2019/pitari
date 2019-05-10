class UsersController < ApplicationController
  def new
    @user = User.new
    @user.discuss_id = params[:discuss_id]
  end

  def create
    @user = User.new
    @user.discuss_id = user_params["discuss_id"]
    @user.name = user_params["name"]
    @discuss = Discuss.find(@user.discuss_id)
    if @user.save
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
