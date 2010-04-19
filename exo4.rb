require 'devise.rb'

gbp= Devise.new
gbp.name= 'Livres'
gbp.exchange_rate= 1.3471

yen= Devise.new
yen.name= 'Yens'
yen.exchange_rate= 0.010868

eur= Devise.new
eur.name= 'Euros'
eur.exchange_rate= 1.3471


devises = {
	:livre => gbp,
	:yen => yen,
	:eur =>  eur
}

puts devises