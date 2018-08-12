require 'json'
require 'net/http'

module FetchProjects
  class FetchProjects_tag <Liquid::Tag

    def initialize(tag_name, text, tokens)
      super
      @text = text
    end
    
    def render(context)
      if /(.+) from url (.+)/.match(@text)
        resp = Net::HTTP.get_response(URI($2.strip))
        data = JSON resp.body
        # Filter and sort repositories
        if data.length > 0
          data = data.select { |repo| repo["fork"] == false }
          data = data.sort_by! { |x| Date.parse x['updated_at'] }.reverse!
        end
        # Retrun final context
        context[$1] = data
        nil
      else
        # syntax error
        raise ArgumentError, 'ERROR:bad_syntax'
      end
    end

  end
end

Liquid::Template.register_tag('fetch_projects', FetchProjects::FetchProjects_tag)