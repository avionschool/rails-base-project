class User::ParameterSanitizer < Devise::ParameterSanitizer
  def initialize(*)
    super
    permit(:sign_up, keys: %i[username email password password_confirmation remember_me])
    permit(:sign_in, keys: %i[username password remember_me])
    permit(:account_update, keys: %i[username password password_confirmation current_password])
  end
end
