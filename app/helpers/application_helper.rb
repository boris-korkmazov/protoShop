module ApplicationHelper
  def active_class(link_path)
    (request.original_url.include? link_path) ? "active": ""
  end
end
