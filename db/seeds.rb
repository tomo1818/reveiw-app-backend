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


# カテゴリーを作成
category1 = Category.create!(name: 'Category1', group: group1)
category2 = Category.create!(name: 'Category2', group: group2)
category3 = Category.create!(name: 'Category3', group: group1)
category4 = Category.create!(name: 'Category4', group: group1)

# レビューを作成
review1 = Review.create!(title: 'Review1', category: category1, evaluation: 5, done: false, visit_day: 'Sat, 03 Sep 2022')
review2 = Review.create!(title: 'Review2', category: category1, evaluation: 5, done: false, visit_day: 'Sat, 03 Sep 2022')
review3 = Review.create!(title: 'Review3', category: category2, evaluation: 5, done: false, visit_day: 'Sat, 03 Sep 2022')
review4 = Review.create!(title: 'Review4', category: category2, evaluation: 5, done: false, visit_day: 'Sat, 03 Sep 2022')
review5 = Review.create!(title: 'Review5', category: category3, evaluation: 5, done: false, visit_day: 'Sat, 03 Sep 2022')
review6 = Review.create!(title: 'Review6', category: category4, evaluation: 5, done: false, visit_day: 'Sat, 03 Sep 2022')
review7 = Review.create!(title: 'Review7', category: category1, evaluation: 5, done: false, visit_day: 'Sat, 03 Sep 2022')