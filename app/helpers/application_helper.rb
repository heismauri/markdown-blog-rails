module ApplicationHelper
  def page_title(separator = " • ")
    [content_for(:title), 'Markdown Blog Rails'].compact.join(separator)
  end

  def custom_page_title(title)
    content_for(:title) { title }
  end

  def markdown(article)
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
    markdown.render(article).html_safe
  end
end
