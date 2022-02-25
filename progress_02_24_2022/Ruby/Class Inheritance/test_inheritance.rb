require_relative "inheritance.rb"

david = Employee.new("David", "TA", 10000, "Darren")
shawna = Employee.new("Shawna", "TA", 12000, "Darren")
darren = Manager.new("Darren", "TA Manager", 78000, "Ned", [shawna, david])
ned = Manager.new("Ned","Founder",1000000, nil, [darren])

puts ned.bonus(5) # => 500_000
puts darren.bonus(4) # => 88_000
puts david.bonus(3) # => 30_000
puts david.name == "David"
puts david.title == "TA"
puts shawna.name == "Shawna"
puts shawna.title == "TA"
puts darren.name == "Darren"
puts darren.title == "TA Manager"
puts ned.name == "Ned"
puts ned.title == "Founder"