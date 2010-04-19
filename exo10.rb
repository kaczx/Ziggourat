require 'db.rb'
require 'devise.rb'
require 'auction.rb'
require 'amount.rb'

@db = Db.new
@db.open

# Creation des tbs
@db.create_devise
@db.create_wallet

# Currency
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

# Insert des devises
array = devise.values
array.each do |devise|
  @db.save_devise(devise.name, devise.exchange_rate)
end

a_gbp = Amount.new
a_gbp.name= 'Livres'
a_gbp.amount = 250
a_yen = Amount.new
a_yen.name= 'Yens'
a_yen.amount = 350
a_eur = Amount.new
a_eur.name= 'Euros'
a_eur.amount = 200

amounts = {
	:livre => a_gbp,
	:yen => a_yen,
	:eur =>  a_eur
}

# Insert des amounts
array2 = amounts.values
array2.each do |x|
  @db.save_wallet(x.name, x.amount)
end

total = 0

@db.db.execute( "select w.name, w.amount, d.rate_currency from wallet w, devises d WHERE w.name=d.name GROUP BY w.name" ) do |row|
  p row
  total_devise= row[1].to_f* row[2].to_f
  p row[0]
  p total_devise
  total += total_devise.to_f
end

p total


@db.close()