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
        {name: 'Тема1'},
        {name: 'Тема2'}
    ]
)