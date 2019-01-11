require_relative('../db/sql_runner.rb')

class Film

  attr_reader :id
  attr_accessor :title, :price

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @price = options['price']
  end

  def save()
    sql = "INSERT INTO films (title, price) VALUES ($1, $2) RETURNING id"
    values = [@title, @price]
    film = SqlRunner.run(sql, values).first
    @id = film['id'].to_i
  end

  def update()
    sql = "UPDATE films SET (title, price) = ($1, $2) WHERE id = $3"
    values = [@title, @price, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM films WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM films"
    values = []
    films = SqlRunner.run(sql, values)
    return films.map{|film| Film.new(film)}
  end

  def self.delete_all()
    sql = "DELETE FROM films"
    values = []
    SqlRunner.run(sql, values)
  end

  def customers()
    sql = "SELECT customers.* FROM customers INNER JOIN tickets ON tickets.customer_id = customers.id WHERE tickets.film_id = $1"
    values = [@id]
    customers = SqlRunner.run(sql, values)
    return customers.map {|customer| Customer.new(customer)}
  end

  def number_of_customers()
    result = customers()
    return result.count
  end

  def screenings()
    sql = "SELECT screenings.* FROM screenings INNER JOIN films ON films.id = screenings.film_id WHERE screenings.film_id = $1"
    values = [@id]
    screenings = SqlRunner.run(sql, values)
    return screenings.map {|screening| Screening.new(screening)}
  end

  def popular_time()
    array = screenings()
    sold = 0
    for item in array
      if item.tickets_sold() > sold
        sold = item.tickets_sold()
        most_popular = item.time
      end
    end
    return most_popular
  end


end
