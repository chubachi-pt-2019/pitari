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
    @discuss.save

    user = User.new
    user.name = discuss_params["user"]["name"]
    user.discuss_id = @discuss.id
    user.save

    agenda = Agenda.new
    agenda.name = discuss_params["user"]["agenda"]["name"]
    agenda.opinion = discuss_params["user"]["agenda"]["opinion"]
    agenda.user_id = user.id
    agenda.save
    redirect_to @discuss
  end
  
  private
  
    def discuss_params
      params.require(:discuss).permit(:name, {user: [:name, {agenda: [:name, :opinion]} ] } )
    end

    
end
