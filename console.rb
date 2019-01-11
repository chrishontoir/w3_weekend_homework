require_relative('./models/customer.rb')
require_relative('./models/film.rb')
require_relative('./models/ticket.rb')
require_relative('./models/screening.rb')

require('pry')

Ticket.delete_all()
Screening.delete_all()
Film.delete_all()
Customer.delete_all()



customer1 = Customer.new({'name' => 'John Smith', 'funds' => '100'})
customer1.save()

customer2 = Customer.new({'name' => 'Bill Jones', 'funds' => '50'})
customer2.save()

customer3 = Customer.new({'name' => 'Emily Davies', 'funds' => '75'})
customer3.save()

customer2.funds = "65"



film1 = Film.new({'title' => 'Lord of the Rings', 'price' => '5'})
film1.save()

film2 = Film.new({'title' => "The Matrix", 'price' => '10'})
film2.save()

film2.price = "7"



screening1 = Screening.new({'film_id' => film1.id, 'date' => '01/02/2019', 'time' => '19:00', 'available_seats' => '50'})
screening1.save()

screening2 = Screening.new({'film_id' => film1.id, 'date' => '02/02/2019', 'time' => '10:00', 'available_seats' => '25'})
screening2.save()

screening3 = Screening.new({'film_id' => film2.id, 'date' => '03/02/2019', 'time' => '21:00', 'available_seats' => '40'})
screening3.save()

screening4 = Screening.new({'film_id' => film1.id, 'date' => '04/02/2019', 'time' => '13:00', 'available_seats' => '15'})
screening4.save()



ticket1 = Ticket.new({'customer_id' => customer1.id, 'screening_id' => screening2.id})
ticket1.save()

ticket2 = Ticket.new({'customer_id' => customer2.id, 'screening_id' => screening3.id})
ticket2.save()

ticket3 = Ticket.new({'customer_id' => customer3.id, 'screening_id' => screening2.id})
ticket3.save()

# ticket2.customer_id = customer1.id

ticket4 = Ticket.new({'customer_id' => customer3.id, 'screening_id' => screening4.id})
ticket4.save()

binding.pry
nil
