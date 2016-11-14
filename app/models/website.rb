class Website < ApplicationRecord
	validates :url, presence: true
	enum status: [:ok, :not_ok, :unchecked]

	def check_now
		ping = Ping.new(self.url)
		self.status = ping.check.downcase
		self.lastchecked = ping.timestamp
		self.save
	end
end
