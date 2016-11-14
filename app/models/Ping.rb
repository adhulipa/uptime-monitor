require 'net/http'
require 'rufus-scheduler'

class Ping


	module Status
		OK        = "OK"
		NOT_OK    = "NOT_OK"
		UNCHECKED = "UNCHECKED"
	end

	attr_reader :url
	attr_reader :timestamp
	attr_reader :status

	@timeout
	@scheduler

	def initialize(url)
		@url = url
		@timeout = 10
		@status  = Status::UNCHECKED
	end

	def check
		@timestamp = Time.now
		@status = Ping.check(@url)
		return @status
	end

	private
	def self.check(url)
		url = URI.parse(url)
		req = Net::HTTP::Get.new(url.to_s)

		begin
			res = Net::HTTP.start(url.host, url.port) do |http|
				http.request(req)
			end

			case res.code
			when "200"
				status = Ping::Status::OK
			when "301"
				status = self.check(res.header['location'])
			else
				status = Ping::Status::NOT_OK
			end
		rescue Errno::ECONNREFUSED
			status = Ping::Status::NOT_OK
		end

		return status
	end

end
