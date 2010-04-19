require 'value.rb'
class Auction
  
  attr_accessor :name, :exchange_rate
	include Value
	
	def random
	  @exchange_rate.call
	end
	
end
