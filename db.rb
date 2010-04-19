require 'rubygems'
require 'sqlite3'

class Db

  attr_accessor :db

  def open
    @db = SQLite3::Database.new('wallet.db')
  end
  
  def create_devise
    @db.execute('DROP TABLE IF EXISTS devises')
    @db.execute('Create table devises (name varchar(10), rate_currency float)')
  end

  def create_wallet
    @db.execute('DROP TABLE IF EXISTS wallet')
    @db.execute('Create table wallet (name varchar(10), amount float)')
  end
  
  def save_devise(name, rate_currency)
    @db.execute('INSERT INTO devises VALUES (:name, :rate_currency)', "name" => name, "rate_currency" => rate_currency)
  end
  
  def save_wallet(name, amount)
    @db.execute('INSERT INTO wallet VALUES (:name, :amount)', "name" => name, "amount" => amount)
  end  

  def close  
    @db.close()
  end
  
end