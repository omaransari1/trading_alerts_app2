require 'csv'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

csv_text = File.read(Rails.root.join('db', 'Russell1000symbols_names - Sheet1.csv'))
csv = CSV.parse(csv_text, encoding:'iso-8859-1:utf-8')

csv.each do |row|
  s = Stock.new
  s.company = row[0]
  s.symbol = row[1]
  s.save
end

puts "There are now #{Stock.count} rows in the Stocks table"