class DiscussController < ApplicationController

  def index
  end
  
  def show
    if session[:user_id] && User.exists?(id: session[:user_id])
      @user_id = session[:user_id]

      if !session[:new_in]
        user = User.find(session[:user_id])
        ReturnJob.set(wait: 2.second).perform_later user
      end
      session.delete :new_in
      @discuss = Discuss.find(params[:id])
    else
      redirect_to root_path
    end
  end

  def new
    @discuss = Discuss.new
    user = @discuss.users.build
    user.agendas.build
  end

  def create
    @discuss = Discuss.new
    @discuss.name = discuss_params["name"]
    if @discuss.save
    else
      flash.now[:danger] = @discuss.errors.full_messages
    end

    user = User.new(name: discuss_params["user"]["name"],
                    discuss_id: @discuss.id,
                    active: true
                    )
    if user.save
      @user_id = user.id
    else
      flash.now[:danger] = user.errors.full_messages
    end
    session[:user_id] = user.id
    agenda = Agenda.new(name:    discuss_params["user"]["agenda"]["name"],
                        opinion: discuss_params["user"]["agenda"]["opinion"],
                        user_id: user.id)
    if agenda.save
      session[:new_in] = true
      redirect_to @discuss
    else
      flash.now[:danger] = agenda.errors.full_messages
      render :new
    end
  end
  
  private
  
    def discuss_params
      params.require(:discuss).permit(:name, {user: [:name, {agenda: [:name, :opinion]} ] } )
    end
    
end
