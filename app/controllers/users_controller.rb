class UsersController < ApplicationController
  def new
    @users = User.new
    @users.discuss_id = params[:discuss_id]
  #  user = @users.create
  #  puts @discuss_id
  end

  def create
    @users = User.new
    @users.discuss_id = user_params["discuss_id"]
    @users.name = user_params["name"]
    puts @users
    if @users.save
      flash[:danger] = @users.errors.full_messages
    end
  end

    private
  
    def user_params
      params.require(:user).permit(:name)
    end
    
end
