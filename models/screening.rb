require_relative('../db/sql_runner.rb')

class Screening

  attr_reader :id
  attr_accessor :film_id, :date, :time, :available_seats

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @film_id = options['film_id'].to_i
    @date = options['date']
    @time = options['time']
    @available_seats = options['available_seats'].to_i
  end

  def save()
    sql = "INSERT INTO screenings (film_id, date, time, available_seats) VALUES ($1, $2, $3, $4) RETURNING id"
    values = [@film_id, @date, @time, @available_seats]
    screening = SqlRunner.run(sql, values).first
    @id = screening['id'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM screenings"
    values = []
    SqlRunner.run(sql, values)
  end

  def tickets()
    sql = "SELECT tickets.* FROM tickets INNER JOIN screenings ON screenings.id = tickets.screening_id WHERE tickets.screening_id = $1"
    values = [@id]
    tickets = SqlRunner.run(sql, values)
    return tickets.map {|ticket| Ticket.new(ticket)}
  end

  def tickets_sold()
    tickets = tickets()
    tickets_sold = tickets.count
    return tickets_sold
  end


end
