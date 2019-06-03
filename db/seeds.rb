# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(first_name: "fede", last_name: "cava",email:"test@wolox.com.ar", password:"1234567A", password_confirmation: "1234567A")
User.create(email: 'test1@wolox.com.ar', password: '123123123', password_confirmation: '123123123', first_name: 'Test', last_name: 'TestLastName')
Book.create(genre: "Fantacia", author: "JK", image: "Ruta", title: "Harry Potter", editorial: "Test", year: "2000")
Rent.create(user: User.first, book: Book.first, start_at: '2019-04-12', end_at: '2019-05-12')
