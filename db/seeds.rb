# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# ユーザー作成
user1 = User.create!(name: 'User1', email: 'test1@email.com', password: 'password', password_confirmation: 'password')
user2 = User.create!(name: 'User2', email: 'test2@email.com', password: 'password', password_confirmation: 'password')
user3 = User.create!(name: 'User3', email: 'test3@email.com', password: 'password', password_confirmation: 'password')

#グループ作成
group1 = Group.create!({name:"GROUP1"})
group2 = Group.create!({name:"GROUP2"})
group3 = Group.create!({name:"GROUP3"})

#関連付けを追加
user1.groups << group1
user1.groups << group2
user1.save

user2.groups << group2
user2.groups << group3
user2.save

user3.groups << group3
user3.groups << group1
user3.save

Category.create!(name: 'Category1', group: group1)
Category.create!(name: 'Category2', group: group2)
Category.create!(name: 'Category3', group: group1)
Category.create!(name: 'Category4', group: group1)