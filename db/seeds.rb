# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.create([{ title: 'Breakfast' }, { title: 'Lunch' },
                   { title: 'Dinner' }, { title: 'Snack' }, { title: 'Drink' }])

puts Cowsay.say('Generated 5 categories', 'random')

5.times do
  f = Food.create({ title: Faker::Book.title,
                    calories: Faker::Number.between(1, 400),
                    macro_group: Faker::Book.genre,
                    date: Faker::Date.between(2.days.ago, Date.today),
                    category_id: rand(5) + 1
                    })
end

puts Cowsay.say('Generated 5 foods', 'random')


5.times do
  User.create ({first_name: Faker::Name.first_name, last_name: Faker::Name.last_name,
    email: Faker::Internet.email, password: "password"})
  end

  users = User.all

puts Cowsay.say('Generated 5 users', 'random')
