#START:i18n
class ApplicationController < ActionController::Base
  #START_HIGHLIGHT
  before_action :set_i18n_locale_from_params
  #END_HIGHLIGHT
  # ...
  #END:i18n
  before_action :authorize
  protect_from_forgery with: :exception

    # ...

#START:i18n
  protected
#END:i18n

    def authorize
      if request.format == Mime[:html]
        unless User.find_by(id: session[:user_id])
          redirect_to login_url, notice: "Please log in"
        end
      else
        authenticate_or_request_with_http_basic do |username, password|
          user = User.find_by(name: username)
          user && user.authenticate(password)
        end
      end
    end

    #START:i18n
    #START_HIGHLIGHT
    def set_i18n_locale_from_params
      if params[:locale]
        if I18n.available_locales.map(&:to_s).include?(params[:locale])
          I18n.locale = params[:locale]
        else
          flash.now[:notice] = 
            "#{params[:locale]} translation not available"
          logger.error flash.now[:notice]
        end
      end
    end
    #END_HIGHLIGHT
end
#END:i18n
