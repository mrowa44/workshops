# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Users
5.times do
  User.create(email: FFaker::Internet.email,
              password: FFaker::Internet.password,
              admin: false,
              firstname: FFaker::Name.first_name,
              lastname: FFaker::Name.last_name)
end

# Admin
unless User.find_by(email: 'admin@example.com')
  User.create(email: 'admin@example.com',
                password: 'secret123',
                admin: true,
                firstname: FFaker::Name.first_name,
                lastname: FFaker::Name.last_name)
end

# Categories
Category.find_or_create_by(name: 'Action')
Category.find_or_create_by(name: 'Fantasy')

20.times do
  Product.create(title: FFaker::Movie.title,
                 description: FFaker::DizzleIpsum.paragraph,
                 price: rand(100),
                 user: User.find(rand(User.count) + 1),
                 category: Category.find(rand(Category.count) + 1)
                 )
end

50.times do
  Review.create(content: FFaker::DizzleIpsum.sentence,
                rating: rand(5) + 1,
                product: Product.find(rand(Product.count) + 1),
                user: User.find(rand(User.count) + 1)
               )
end
