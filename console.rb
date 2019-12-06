require('pry')
require_relative("models/customer")
require_relative("models/film")
require_relative("models/ticket")

Ticket.delete_all()
Film.delete_all()
Customer.delete_all()

customer1 = Customer.new({
  "name" => "Billy",
  "funds" => 100
  })
customer1.save()


film1 = Film.new({
  "title" => "Home Alone",
  "price" => 5
  })
film1.save()



binding.pry
nil
