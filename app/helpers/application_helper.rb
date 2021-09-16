module ApplicationHelper
  def append_admin_style(curr_class)
    request.fullpath.start_with?('/admins/') ? "#{curr_class} admin" : curr_class.to_s
  end
end
