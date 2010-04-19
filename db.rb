require 'rubygems'
require 'sqlite3'

class Db

  def open
    @db = SQLite3::Database.new('wallet.db')
  end
  
  def create
    @db.execute('create table devises (name varchar(10), rate_currency float)')
  end
  
  def save(name, rate_currency)
    @db.execute('INSERT INTO devises VALUES (:name, :rate_currency)', "name" => name, "rate_currency" => rate_currency)
  end

  def close  
    @db.close()
  end
  
end