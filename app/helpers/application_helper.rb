module ApplicationHelper
  def page_title(separator = ' // ')
    [content_for(:title), 'Markdown Blog Rails'].compact.join(separator).html_safe
  end

  def custom_page_title(title)
    content_for(:title) { title }
  end

  def markdown(article)
    options = %i[hard_wrap autolink no_intra_emphasis fenced_code_blocks filter_html]
    Markdown.new(article, *options).to_html.html_safe
  end
end
