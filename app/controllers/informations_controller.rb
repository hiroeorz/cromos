class InformationsController < ApplicationController

  def index
    render
  end

  def select
    session[:type] = params[:type]
    redirect_to :controller => :diagnoses, :action => :index
  end

end
