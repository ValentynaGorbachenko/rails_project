# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = [{first_name: "Kolia", last_name: "Portnov", email: "kolia@dojo.com", password: "password", password_confirmation: "password"}, {first_name: "Elena", last_name: "Belova", email: "elena@dojo.com", password: "password", password_confirmation: "password"}, {first_name: "Sveta", last_name: "Lebedeva", email: "sveta@dojo.com", password: "password", password_confirmation: "password"}]
create_users = User.create(users)
groups = [{name: "Awesome group of ninjas", description: "Join our awesome group today and become a ninja!", user: User.first}, {name: "Awesome group of samurais", description: "Join our awesome group today and become a samurai!", user: User.first}, {name: "Cool group", description: "Join our cool group today!!!", user: User.second}, {name: "Web ninjas", description: "Become ninja today! JOIN!!!", user: User.second}]
create_groups = Group.create(groups)

Member.create({user: User.first, group: Group.first})
Member.create({user: User.first, group: Group.second})

Member.create({user: User.second, group: Group.third})
Member.create({user: User.second, group: Group.fourth})

Member.create({user: User.third, group: Group.first})
Member.create({user: User.third, group: Group.second})
Member.create({user: User.third, group: Group.third})
Member.create({user: User.third, group: Group.fourth})
