require 'faraday'
require 'json'

#class allows for connection between base URL and API
class Connection
	#base URL used for POST/GET requests
	BASE = 'https://api.imgur.com/3/image'

	def self.api
		Faraday.new(url: BASE) do |faraday|
			faraday.response :logger
			faraday.adapter Faraday.default_adapter
			#headers sent for anonymous POST/GET requests
			faraday.headers['Content-Type'] = 'application/json'
			faraday.headers['Authorization'] = ENV['CLIENT_ID']
		end
	end
end