class WelcomeController < ApplicationController
  def index
p ["index", current_user]
    if current_user
      redirect_to :user_root
      return
    end
  end
end
