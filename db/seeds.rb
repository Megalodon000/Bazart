require 'faker'

List.destroy_all
Product.destroy_all
User.destroy_all

puts 'Database has been cleaned.'

def generate_moroccan_firstname
  first_names = ['Mohamed', 'Fatima', 'Youssef', 'Amina', 'Omar', 'Nadia', 'Hassan', 'Zainab', 'Ali', 'Sofia']
  first_names.sample
end

puts 'Creating users...'

def generate_moroccan_lastname
  last_names = ['Benali', 'El Amrani', 'Chakir', 'Lamrani', 'Kadiri', 'El Fassi', 'Nouri', 'Tazi', 'Bouazza', 'Bensaid']
  last_names.sample
end

puts 'Creating users2...'

def collection_select
  collections = %w(chairs tables lamps shelves desks pots sofas chandeliers vases jewelry)
  collections.sample
end

puts 'Creating mater...'

def material_select
  materials = %w(Gold Silver Bronze glass wood plastic pottery clay marble plaster aluminum)
  materials.sample
end

puts 'Creating color...'

def color_select
  colors = %w(Red Blue Green Yellow Black White Purple Brown)
  colors.sample
end

puts 'Creating image...'

def attach_image(model, image_url)
  file_name = "default_image.png"
  content_type = "image/png"

  file = URI.open(image_url)
  model.photo.attach(io: file, filename: file_name, content_type: content_type)
  model.save
end

# Users
user1 = User.create(
  email: 'john.doe@example.com',
  first_name: generate_moroccan_firstname,
  last_name: generate_moroccan_lastname,
  address: 'rabat agdal',
  phone_number: '555-1234',
  password: 'password',
  nickname: 'john12'
)
attach_image(user1, 'https://source.unsplash.com/300x300/?portrait')

user2 = User.create(
  email: 'jane.smith@example.com',
  first_name: generate_moroccan_firstname,
  last_name: generate_moroccan_lastname,
  address: '380 bouvard roudani casablanca',
  phone_number: '555-5678',
  password: 'password',
  nickname: 'jane15'
)
attach_image(user2, 'https://source.unsplash.com/300x300/?portrait')


user3 = User.create(
  email: 'alex.johnson@example.com',
  first_name: generate_moroccan_firstname,
  last_name: generate_moroccan_lastname,
  address: 'Place Jemaa el fna Marrakech',
  phone_number: '555-9012',
  password: 'password',
  nickname: 'alex20'
)
attach_image(user3, 'https://source.unsplash.com/300x300/?portrait')


# Generate 10 Products
10.times do |i|
  puts "Creating product #{i + 1}"

  p = Product.create(
    title: Faker::Name.name_with_middle,
    description: Faker::Lorem.paragraph,
    price: rand(500..1000),
    collection: collection_select,
    material: material_select,
    color: color_select,
    craftman_id: User.all.sample.id
  )
  attach_image(p, "https://source.unsplash.com/random/900%C3%97700/?product")
end

puts 'Seed data has been created successfully.'
