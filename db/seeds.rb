# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
print "Creating default user..."
User.create!(:email => "admin@domain.tld", :password => "vlurps")
puts "OK"
puts "Default user: admin@domain.tld; Password: vlurps"
