class DiscussController < ApplicationController

  def index
    @discuss = Discuss.last
  end

  def new
  end

end
