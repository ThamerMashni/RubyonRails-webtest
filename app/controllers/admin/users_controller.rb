class Admin::UsersController < Admin::ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  

  def index
    @users = User.all.with_attached_cvFile
  end

  # GET /users/1
  # GET /users/1.json
  def show
    
  end


  def edit
    
  end

  def update
    
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to admin_users_url, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
        # format.pdf { send_data @user.cvFile}
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end  
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to admin_users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params

      params.require(:user).permit(:name, :email, :password, :password_confirmation,:mobile, :gender ,:admin,:cvFile)
    end
end
