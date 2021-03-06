module EditorHelper
  class HTMLwithCoderay < Redcarpet::Render::HTML
    def block_code(code, language)
      tmp = language.try(:split, ':')
      if tmp.blank?
        language = ''
      else
        language = tmp[0]
      end

      case language.to_s
      when 'rb'
        lang = 'ruby'
      when 'yml'
        lang = 'yaml'
      when 'css'
        lang = 'css'
      when 'html'
        lang = 'html'
      when ''
        lang = 'md'
      else
        lang = language
      end

      CodeRay.scan(code, lang).div
    end
  end

  def markdown(text)
    html_render = HTMLwithCoderay.new(filter_html: true, hard_wrap: true)
    options = md_options
    markdown = Redcarpet::Markdown.new(html_render, options)
    markdown.render(text)
  end

  private

  def md_options
    {
      autolink: true,
      space_after_headers: true,
      no_intra_emphasis: true,
      fenced_code_blocks: true,
      tables: true,
      hard_wrap: true,
      xhtml: true,
      lax_html_blocks: true,
      strikethrough: true
    }
  end
end