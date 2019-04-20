class DiscussController < ApplicationController

  def index
  end

  def new
    @discuss = Discuss.new
    user = @discuss.users.build
    user.agendas.build
  end

  def create
    Discuss.new(discuss_params).save
    render "show"
  end
  
  private
  
    def discuss_params
      params.require(:discuss).permit(:name)
    end

    
end
