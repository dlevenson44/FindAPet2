#taken
require 'httparty'
require 'net/http'

module Imgur

	HTML_PATH = 'https:/imgur.com'
	API_PATH = 'https://api.imgur/com/3/'
	UPLOAD_PATH = 'upload'
	IMAGE_PATH = 'image/'

	class Client
		attr_accessor :client_id

		def initialize(client_id)
			@client_id = client_id
		end

		def post(url, body={})
			resp = HTTParty.post(url, body: body, headers: auth_header)
			raise NotFoundException.new if resp.response.is_a? Net::HTTPNotFound
			resp
		end

		def get_image(id)
			url = API_PATH + IMAGE_PATH + id
			resp = get(url).parsed_response
			Image.new(resp['data'])
		end

		def upload(local_file)
			local_file.file.rewind
			image = local_file.file.read
			body = {image: image, type: 'file'}
			body[:title] = local_file.title if local_file.title
			body[:description] = local_file.description if local_file.description
			body[:album] = local_file.album_id if local_file.album_id
			resp = post(API_PATH + UPLOAD_PATH, body).parsed_response
			data = resp['data'].merge({'title' => body[:title], 'description' => body[:description]})
			Image.new(data)
		end

		def auth_header
			{'Authorization' => 'Client-ID' + @client_id}
		end
	end

	#Represents image stored on computer
	class LocalImage
		attr_accessor :file, :title, :description, :album_id

		def initialize(file, options={})
			if file.is_a? String
				@file = File.open file, 'rb'
			else
				@file = file
			end
			@title = options[:title]
			@description = options[:description]
			@album_id = options[:album_id]
		end
	end

	#Represents an image on Imgur
	class Image
		attr_accessor :id, :title, :description, :date, :type, :animated, :width, :height, :size, :views, :bandwidth, :favorite, :nsfw, :section, :deletehash, :link, :html_link

		def initialize(data)
			@id = data['id']
			@title = data['title']
			@description = data['description']
			@date = Time.at data['datetime']
			@type = data['type']
			@animated = data['animated']
			@width = data['width']
			@height = data['height']
			@size = data['size']
			@views = data['views']
			@bandwidth = data['bandwidth']
			@favorite = data['favorite']
			@nsfw = data['nsfw']
			@section = data['section']
			@deletehash = data['deletehash']
			@link = data['link']
			@html_link = HTML_PATH + @id
		end
	end

	class NotFoundException < Exception
		def initialize(msg='404 Not Found')
			super msg
		end
	end

	def UpdateException < Exception
		def initialize(msg)
			super msg
		end
	end

	def self.new(client_id)
		Client.new client_id
	end
end