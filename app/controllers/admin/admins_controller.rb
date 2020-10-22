class Admin::AdminsController < Admin::ApplicationController

  def index
    @users = User.all
  end


end
