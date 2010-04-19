require 'devise.rb'
require 'auction.rb'

gbp= Devise.new
gbp.name= 'Livres'
gbp.exchange_rate= 1.3471

yen= Devise.new
yen.name= 'Yens'
yen.exchange_rate= 0.010868

eur= Devise.new
eur.name= 'Euros'
eur.exchange_rate= 1.3471


devise = {
	:livre => gbp,
	:yen => yen,
	:eur =>  eur
}

#devises.delete_if{|key, value| key == :yen }
array = devise.values
array.sort_by {|devise| devise.exchange_rate}

@avg= 0
array.each {|devise|
  @avg+= devise.exchange_rate
}

puts @avg/array.length

puts array