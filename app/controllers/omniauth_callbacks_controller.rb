class OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def facebook
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @user = User.from_omniauth(request.env["omniauth.auth"])
    @token = request.env["omniauth.auth"].credentials.token
    @graph = Koala::Facebook::API.new(@token)

    if @user.persisted?
      sign_in @user
      set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
    redirect_to root_path
  end

  def failure
    redirect_to root_path
  end
end
