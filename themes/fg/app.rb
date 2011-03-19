# Use the app.rb file to load Ruby code, modify or extend the models, or
# do whatever else you fancy when the theme is loaded.

module Nesta
  class App
    # Uncomment the Rack::Static line below if your theme has assets
    # (i.e images or JavaScript).
    #
    # Put your assets in themes/fg/public/fg.
    #
    use Rack::Static, :urls => ["/fg"], :root => "themes/fg/public"

    helpers do
      # Add new helpers here.
    end

    # Add new routes here.

			# redirect old links with timestamp path
		get %r{/\d{4}/\d{2}/\d{2}/([\w/.-]+)} do |page|
		  redirect "/#{page}"
		end
  end
end
