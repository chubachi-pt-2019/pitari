class DiscussController < ApplicationController

  def new
    @discuss = Discuss.new
    user = @discuss.users.build
    user.agendas.build
  end

  def create
    @discuss = Discuss.new(discuss_params)
    @discuss.save
    render "show"
  end
  
  private
  
    def discuss_params
      params.require(:discuss).permit(:name, user_attributes: [:name, agenda_attributes: [:name, :opinion]])
    end

    
end
