# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#User.create(name: 'test', email: 'test@gmail.com', password: 'test0020')
5.times do 
    Task.create(
        name: 'task',
        content: 'content', 
        status:1,
        priority:2,
        ending_date: DateTime.now) 
    end
        