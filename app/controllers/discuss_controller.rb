class DiscussController < ApplicationController

  def index
  end
  def show
    if session[:user_id]
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
                    discuss_id: @discuss.id)
    if user.save
    else
      flash.now[:danger] = user.errors.full_messages
    end
    session[:user_id] = user.id
    agenda = Agenda.new(name:    discuss_params["user"]["agenda"]["name"],
                        opinion: discuss_params["user"]["agenda"]["opinion"],
                        user_id: user.id)
    if agenda.save
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
