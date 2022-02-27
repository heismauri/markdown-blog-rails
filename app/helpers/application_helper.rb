module ApplicationHelper
  def page_title(separator = ' // ')
    [content_for(:title), DEFAULT_META["meta_title"]].compact.join(separator).html_safe
  end

  def custom_page_title(title)
    content_for(:title) { title }
  end

  def current_controller?(name)
    name.include?(controller.controller_name)
  end
end
