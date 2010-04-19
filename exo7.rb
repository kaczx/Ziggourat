require 'devise.rb'
require 'auction.rb'

devise = Auction.new
devise.exchange_rate = lambda {
  130+rand(20)
}

puts devise.random