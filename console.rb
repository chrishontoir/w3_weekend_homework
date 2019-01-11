require_relative('./models/customer.rb')
require_relative('./models/film.rb')
require_relative('./models/ticket.rb')

require('pry')

Ticket.delete_all()
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



ticket1 = Ticket.new({'customer_id' => customer1.id, 'film_id' => film1.id})
ticket1.save()

ticket2 = Ticket.new({'customer_id' => customer2.id, 'film_id' => film2.id})
ticket2.save()

ticket3 = Ticket.new({'customer_id' => customer3.id, 'film_id' => film1.id})
ticket3.save()

# ticket2.customer_id = customer1.id

ticket4 = Ticket.new({'customer_id' => customer3.id, 'film_id' => film2.id})

binding.pry
nil
