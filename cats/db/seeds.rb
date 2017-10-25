# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Cat.create(birth_date: Date.new(2001, 2,3), color: 'red', name: 'Henry', sex: 'M', description: 'A cat with a googly eye')
Cat.create(birth_date: Date.new(2001, 2,3), color: 'white', name: 'Ellie', sex: 'F', description: 'A grey kitty who is fat')
