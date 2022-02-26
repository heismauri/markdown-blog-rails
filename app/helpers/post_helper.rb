module PostHelper
  def markdown(article)
    options = {
      filter_html: true,
      link_attributes: { rel: 'nofollow' }
    }
    extensions = {
      autolink: true
    }
    renderer = Redcarpet::Render::HTML.new(options)
    markdown = Redcarpet::Markdown.new(renderer, extensions)
    markdown.render(article).html_safe
  end

  def excerpt(article)
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::StripDown)
    truncate(markdown.render(article).html_safe, length: 300, separator: ' ')
  end
end
