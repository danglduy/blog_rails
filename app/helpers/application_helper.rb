module ApplicationHelper
  require "redcarpet"
  require "rouge"
  require "rouge/plugins/redcarpet"

  class HTMLwithPygments < Redcarpet::Render::HTML
    include Rouge::Plugins::Redcarpet
  end

  def full_title page_title = ""
    base_title = "Awesome Blog"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end

  def markdown content
    renderer = HTMLwithPygments.new(
      hard_wrap: true, filter_html: true
    )

    options = {
      autolink: true,
      no_intra_emphasis: true,
      disable_indented_code_blocks: true,
      fenced_code_blocks: true,
      lax_html_blocks: true,
      strikethrough: true,
      superscript: true,
      quote: true,
      highlight: true,
      tables: true,
      emoji: true
    }

    @markdown ||= Redcarpet::Markdown.new(renderer, options).render(content).html_safe
  end

  def current_user? user
    user == current_user
  end

  def redirect_back_or default
    redirect_to(session[:forwarding_url] || default)
    session.delete(:forwarding_url)
  end

  def store_location
    session[:forwarding_url] = request.original_url if request.get?
  end
end
