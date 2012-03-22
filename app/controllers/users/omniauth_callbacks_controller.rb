class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def twitter
    session["twitter_token"] = request.env["omniauth.auth"].credentials.token
    session["twitter_token_secret"] = request.env["omniauth.auth"].credentials.secret
    
    @user = User.find_for_twitter_oauth(request.env["omniauth.auth"], current_user)

    flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Twitter"
    sign_in_and_redirect @user, :event => :authentication
  end
end