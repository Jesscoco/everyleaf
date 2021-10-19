# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
    user = User.create(name: "test_user", email: "text@example.com", is_admin: true, password: "password")
    tasks = Task.all
    
    tasks.each do |task|
        task.update(user_id: User.last.id)
    end
5.times do 
    Task.create(
        user_id: user.id
        name: 'task',
        content: 'content', 
        status:1,
        priority:2,
        ending_date: DateTime.now) 
    end
        
   