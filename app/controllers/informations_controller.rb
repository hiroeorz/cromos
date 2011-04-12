class InformationsController < ApplicationController
  before_filter :authenticate_user!
  def index
    render
  end

  def select
    session[:type] = params[:type]
    redirect_to :controller => :diagnoses, :action => :index
  end

end
