class DiscussController < ApplicationController

  def index
  end

  def new
    @discuss = Discuss.new
    @user = User.new
    @agenda = Agenda.new
  end

 
end
