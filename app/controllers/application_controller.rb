class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    user_path(current_user)
 end

  def after_sign_out_path_for(resource)
    root_path
  end
	protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

def ensure_correct_user
    @book = Book.find_by(id:params[:id])
    if @book.user_id != @current_user.id
      flash[:notice] = "権限がありません"
      redirect_to("/posts/index")
  end
end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,keys:[:name,:email])
    devise_parameter_sanitizer.permit(:sign_in,keys:[:name,:email])
    devise_parameter_sanitizer.permit(:account_update,keys:[:name,:email])
  end
end

