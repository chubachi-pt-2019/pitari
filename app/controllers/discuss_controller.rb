class DiscussController < ApplicationController

  def index
  end
  def show
    @discuss = Discuss.find(params[:id])
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
      flash[:danger] = @discuss.errors.full_messages
    end

    user = User.new(name: discuss_params["user"]["name"],
                    discuss_id: @discuss.id)
    if user.save
    else
      flash[:danger] = user.errors.full_messages
    end

    agenda = Agenda.new(name:    discuss_params["user"]["agenda"]["name"],
                        opinion: discuss_params["user"]["agenda"]["opinion"],
                        user_id: user.id)
    if agenda.save
      redirect_to @discuss
    else
      flash[:danger] = agenda.errors.full_messages
      render :new
    end
  end
  
  private
  
    def discuss_params
      params.require(:discuss).permit(:name, {user: [:name, {agenda: [:name, :opinion]} ] } )
    end
    
end
