module ApplicationHelper
  def full_title page_title = nil
    base_title = t "application_helper.base_title"
    page_title ? page_title + " | " + base_title : page_title
  end
end
