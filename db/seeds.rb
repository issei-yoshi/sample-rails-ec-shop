# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

item1 = Item.new(
  name: 'Cap',
  price: 2000,
  description: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.'
)
item1.image.attach(io: File.open(Rails.root.join('app/assets/images/cap.jpg')), filename: 'cap.jpg')
item1.save!

item2 = Item.new(
  name: 'Glasses',
  price: 5000,
  description: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.'
)
item2.image.attach(io: File.open(Rails.root.join('app/assets/images/glasses.jpg')), filename: 'glasses.jpg')
item2.save!

item3 = Item.new(
  name: 'Jacket',
  price: 3000,
  description: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.'
)
item3.image.attach(io: File.open(Rails.root.join('app/assets/images/jacket.jpg')), filename: 'jacket.jpg')
item3.save!

item4 = Item.new(
  name: 'Pants',
  price: 4000,
  description: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.'
)
item4.image.attach(io: File.open(Rails.root.join('app/assets/images/pants.jpg')), filename: 'pants.jpg')
item4.save!

item5 = Item.new(
  name: 'Shirt',
  price: 1000,
  description: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.'
)
item5.image.attach(io: File.open(Rails.root.join('app/assets/images/shirt.jpg')), filename: 'shirt.jpg')
item5.save!

item6 = Item.new(
  name: 'Shoes',
  price: 7000,
  description: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.'
)
item6.image.attach(io: File.open(Rails.root.join('app/assets/images/shoes.jpg')), filename: 'shoes.jpg')
item6.save!

Cart.create
