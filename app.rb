# Use the app.rb file to load Ruby code, modify or extend the models, or
# do whatever else you fancy when the theme is loaded.
Encoding.default_external = 'utf-8'

require 'rack/codehighlighter'

module Nesta
  class App
    # use Rack::Static, :urls => ["/fg"], :root => "themes/fg/public"
		use Rack::Codehighlighter, :coderay, :markdown => true,
		  :element => "pre>code", 
			:pattern => /\A:::(\w+)\s*(\n|&#x000A;)/i, 
			:logging => false

    helpers do
      # Add new helpers here.
      def latest_articles
        Nesta::Page.find_articles
      end
    end

    # Add new routes here.

		# redirect old links with timestamp path
		get %r{/\d{4}/\d{2}/\d{2}/([\w/.-]+)} do |page|
		  redirect "/blog/#{page}"
		end
  end
end
