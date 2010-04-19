class Devise
	
	attr_accessor :name, :exchange_rate
	
	def to_usd
		@exchange_rate
	end	
end