module Sinatra
  module MyHelper
    include Rack::Utils
    alias_method :h, :escape_html

    def section(key, *args, &block)
      @sections ||= Hash.new{ |k,v| k[v] = [] }
      if block_given?
        @sections[key] << block
      else
        @sections[key].inject(''){ |content, block| content << block.call(*args) } if @sections.keys.include?(key)
      end
    end

    def title(page_title, show_title = true)
      section(:title) { page_title.to_s }
      @show_title = show_title
    end

    def javascript(link, assets = true)
      if assets
        path = "/assets/js/#{link}"
      else
        path = link
      end
      section(:js) do
        capture_haml { haml_tag :script, :src => path }
      end
    end
    def stylesheet(link, assets = true)
      if assets
        path = "/assets/css/#{link}"
      else
        path = link
      end
      section(:css) do
        capture_haml { haml_tag :link, {:href => path, :rel => 'stylesheet'} }
      end
    end

    def show_title?
      @show_title
    end

    def cache_page(seconds=5*60)
      response['Cache-Control'] = "public, max-age=#{seconds}" unless Sinatra::Base.development?
    end
  end
end
