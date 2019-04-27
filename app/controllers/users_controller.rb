class UsersController < ApplicationController
  def new
    @discuss = Discuss.new
    user = @discuss.users.build
    user.agendas.build
  end

end
