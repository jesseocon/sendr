class VerificationsController < ApplicationController
  before_filter :load_user_by_verification_token
  def show
    if @user
      @user.verify!
      flash[:notice] = "Thanks for verifying your account"
    end
    redirect_to(root_path)
  end
  
  private 
    def load_user_by_verification_token
      @user = User.find_by_verification_token(params[:id])
      flash[:notice] = 'Unable to find your account' unless @user
    end
end
