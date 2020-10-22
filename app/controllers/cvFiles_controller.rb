class cvFilesController < ActionController::Base  
  def update
    # params[:avatar] contains a ActionDispatch::Http::UploadedFile object
    Current.user.cvFile.attach(params.require(:cvFile))
    redirect_to Current.user
  end

end
