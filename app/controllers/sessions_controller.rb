#START:setup
class SessionsController < ApplicationController
#START_HIGHLIGHT
  skip_before_action :authorize
#END_HIGHLIGHT
#END:setup
  def new
  end

#START:login
  def create
#START_HIGHLIGHT
    user = User.find_by(name: params[:name])
    if user.try(:authenticate, params[:password])
      session[:user_id] = user.id
      redirect_to admin_url
    else
      redirect_to login_url, alert: "Invalid user/password combination"
    end
#END_HIGHLIGHT
  end
#END:login

#START:logout
  def destroy
#START_HIGHLIGHT
    session[:user_id] = nil
    redirect_to store_index_url, notice: "Logged out"
#END_HIGHLIGHT
  end
#END:logout
end
