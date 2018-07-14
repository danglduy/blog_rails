module ApplicationHelper
  def full_title(page_title = '')
    base_title = "Awesome Blog"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end

  def markdown(text)
    options = {
      autolink: true,
      space_after_headers: true,
      fenced_code_blocks: true,
      underline: true,
      highlight: true,
      footnotes: true,
      tables: true,
      link_attributes: {rel: 'nofollow', target: "_blank"}
    }
    extensions = {
      autolink:           true,
      superscript:        true,
      disable_indented_code_blocks: true,
      tables: true,
      no_intra_emphasis: true,
      strikethrough: true,
      with_toc_data: true,
      fenced_code_blocks: true
    }
    renderer = Redcarpet::Render::HTML.new(options)
    markdown = Redcarpet::Markdown.new(renderer, extensions)
    markdown.render(text).html_safe
   end
end
