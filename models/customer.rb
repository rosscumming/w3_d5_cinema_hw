require_relative("../db/sql_runner")

class Customer

  attr_reader :id, :name
  attr_accessor :funds

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @funds = options['funds'].to_i
  end

  def save()
    sql = "INSERT INTO customers (name, funds) VALUES ($1, $2) RETURNING ID;"
    values = [@name, @funds]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i
  end

  def delete
      sql = "DELETE FROM customers WHERE id = $1;"
      values = [@id]
      SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM customers;"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM customers;"
    artists = SqlRunner.run(sql)
    return artists.map{ |customer| Customer.new(customer)}
  end




end
