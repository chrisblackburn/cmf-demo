module SirTrevorHelper
  def render_sir_trevor(json, image_type='large')
    if hash = parse_sir_trevor(json)
      hash.map { |object|
        render_sir_trevor_block(object, image_type)
      }.compact.join.html_safe
    else
      ''
    end
  end

  private

  def render_sir_trevor_block(object, image_type='large')
    view_name = "sir_trevor/blocks/#{object['type'].to_s.downcase}"

    if object.has_key?("data")
      render(view_name,
        :block => object['data'],
        :image_type => image_type)
    end
  end

  def render_sir_trevor_image(json, image_type='large')
    image = pluck_sir_trevor_type(json, "image")

    if !image.nil? and image.has_key?("data")
      render(:partial => "sir_trevor/blocks/image",
        :locals => {
          :block => image['data'],
          :image_type => image_type,
          :protocol => request.protocol
        }
      )
    end
  end

  def render_sir_trevor_excerpt(json, length = 100)
    text = pluck_sir_trevor_type(json, "text")

    return "" if text.nil? or !text.has_key?('data') or !text['data'].has_key?('text')

    "#{strip_tags(sir_trevor_markdown(text['data']['text']))[0, length]}&hellip;".html_safe
  end

  def sir_trevor_markdown(text)
    renderer_options = {
      :hard_wrap => true,
      :filter_html => true,
      :autolink => true,
      :no_intraemphasis => true,
    }
    renderer = Redcarpet::Render::HTML.new(renderer_options)
    markdown = Redcarpet::Markdown.new(renderer)
    markdown.render(text).html_safe
  end

  def parse_sir_trevor(json)
    hash = JSON.parse(json)

    return false unless hash.has_key?("data")
    hash["data"]
  end

  private

  def pluck_sir_trevor_type(json, type)
    hash = JSON.parse(json)
    if hash.has_key?("data")
      item = hash["data"].select { |item| item["type"] == type }
      item.first
    end
  end

  def sir_trevor_image_tag(block, image_type)
    if block['file'].present? and block['file']['url'].present?
      options = {
        :class => "sir-trevor-image",
        :alt => block['description']
      }

      image_tag(block['file']['url'], options)
    end
  end
end
