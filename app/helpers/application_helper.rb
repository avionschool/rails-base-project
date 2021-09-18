module ApplicationHelper
  def append_admin_style_parent_container(curr_class)
    request.fullpath.start_with?('/admins/') && admin_signed_in? == false ? "#{curr_class} admin" : curr_class.to_s
  end

  def append_admin_style(curr_class)
    request.fullpath.start_with?('/admins/') ? "#{curr_class} admin" : curr_class.to_s
  end
end
