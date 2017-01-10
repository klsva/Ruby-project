# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Image.delete_all
Image.reset_pk_sequence
Image.create(
    [
        {name: 'Первый', file: '1.jpg', theme_id: 2},
        {name: 'Второй', file: '2.jpg', theme_id: 1},
        {name: 'Третий', file: '3.jpg', theme_id: 2},
        {name: 'Четвертый', file: '4.jpg', theme_id: 1},
        {name: 'Пятый', file: '5.jpg', theme_id: 2},
        {name: 'Шестой', file: '6.jpg', theme_id: 1},
        {name: 'Седьмой', file: '7.jpg', theme_id: 2}
    ]
)

Theme.delete_all
Theme.reset_pk_sequence
Theme.create(
    [
        {name: 'Одни велосипеды'},
        {name: 'Другие велосипеды'}
    ]
)

User.create!(name: "Admin User",
              email: "admin@admin.com",
              password: "123456",
              password_confirmation: "123456",
              admin: true)
45.times do |n|
  name = Faker::Name.name
  email = "example-#{n+1}@example.com"
  password = "password"
  User.create!(name: name,
                email: email,
                password: password,
                password_confirmation: password)
end

users = User.order(:created_at).take(6)
10.times do
  album_name = Faker::Lorem.sentence(1)
  album_description = Faker::Lorem.sentence(5)
  users.each {|user| user.albums.create!(album_name: album_name,
                                        album_description: album_description)}
end


#10.times do
#  photo_name = Faker::Number.between(1, 10)
#  albums.each {|album| album.photo_name.create!(photo_name: photo_name)}
#end