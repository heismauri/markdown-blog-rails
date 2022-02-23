# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

bella_goth = User.create(first_name: 'Bella',
                         last_name: 'Goth',
                         email: 'bellagoth@markdown.com',
                         password: '12345678')
betty_newbie = User.create(first_name: 'Betty',
                           last_name: 'Newbie',
                           email: 'bettynewbie@markdown.com',
                           password: '12345678')
