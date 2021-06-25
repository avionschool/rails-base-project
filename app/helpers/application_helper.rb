module ApplicationHelper

  def current_uri
    request.env['PATH_INFO']
  end

  def top_nav_bar?
    return true if current_uri == '/users/sign_up' || current_uri == '/' || current_uri == '/users/sign_in'
  end
end
