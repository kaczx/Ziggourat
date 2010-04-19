require 'devise.rb'

dev = Devise.new
dev.exchange_rate=0.65
dev.name='Euros'

puts dev.name.to_s