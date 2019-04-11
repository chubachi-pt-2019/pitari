class FeelingsController < ApplicationController

  $title = ""
  $yes_count = 0
  $no_count = 0

  def new
  end

  def create
    selection = params[:title]
    if selection && selection.length > 0
      $title = selection
    end
    redirect_to feelings_index_path
  end

  def index
    if session[:voted]
      redirect_to feelings_result_path
    end
  end

  def result
  end

  def vote
    selection = params[:selection]
    if selection == "true"
      $yes_count += 1
    elsif
      $no_count += 1
    end
    puts $yes_count
    puts $no_count
    session[:voted] = true
    redirect_to feelings_result_path
  end
end
