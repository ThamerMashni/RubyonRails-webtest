class Admin::ApplicationController < ApplicationController 
  before_action :ensure_admin_user!

  def ensure_admin_user!
  	unless current_user and current_user.admin?
  		redirect_to root_path, error:'Access denied!'
  	end
  end
end
