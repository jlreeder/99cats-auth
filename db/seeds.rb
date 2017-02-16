# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Cat.destroy_all
User.destroy_all
josh = User.create(user_name: 'josh', password: 'password')
Cat.create(name: 'Simba', birth_date: '2004-01-01',
           color: 'orange', sex: 'M', user_id: josh.id,
           description: 'Good cat')
