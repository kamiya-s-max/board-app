# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Category.create do |c|
  c.id = 1
  c.name = 'ビジネス'
end

Category.create do |c|
  c.id = 2
  c.name = 'スポーツ'
end

Category.create do |c|
  c.id = 3
  c.name = 'アウトドア趣味(スポーツ以外)'
end

Category.create do |c|
  c.id = 4
  c.name = 'ゲーム'
end

Category.create do |c|
  c.id = 5
  c.name = 'インドア趣味(ゲーム以外)'
end

def reset_id(categories)
  connection = ActiveRecord::Base.connection()
  connection.execute("select setval('#{tablename}_id_seq',(select max(id) from #{tablename}))")
end