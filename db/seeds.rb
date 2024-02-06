Product.destroy_all
User.destroy_all
def generate_moroccan_firstname
  first_names = ['Mohamed', 'Fatima', 'Youssef', 'Amina', 'Omar', 'Nadia', 'Hassan', 'Zainab', 'Ali', 'Sofia']
  first_names.sample
end

def generate_moroccan_lastname
  last_names = ['Benali', 'El Amrani', 'Chakir', 'Lamrani', 'Kadiri', 'El Fassi', 'Nouri', 'Tazi', 'Bouazza', 'Bensaid']
  last_names.sample
end

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
  password: 'password'
)
attach_image(user1, 'https://source.unsplash.com/300x300/?portrait')

user2 = User.create(
  email: 'jane.smith@example.com',
  first_name: generate_moroccan_firstname,
  last_name: generate_moroccan_lastname,
  address: '380 bouvard roudani casablanca',
  phone_number: '555-5678',
  password: 'password'
)
attach_image(user2, 'https://source.unsplash.com/300x300/?portrait')


user3 = User.create(
  email: 'alex.johnson@example.com',
  first_name: generate_moroccan_firstname,
  last_name: generate_moroccan_lastname,
  address: 'Place Jemaa el fna Marrakech',
  phone_number: '555-9012',
  password: 'password'
)
attach_image(user3, 'https://source.unsplash.com/300x300/?portrait')


# Generate 10 Products
10.times do |i|
  p = Product.create(
    title: "Product #{i + 1}",
    description: "Description for Product #{i + 1}",
    price: rand(50..500),
    collection: "Collection #{i + 1}",
    material: "Material #{i + 1}",
    color: "Color #{i + 1}",
    craftman_id: User.all.sample.id
  )
  attach_image(p, "https://source.unsplash.com/random/900%C3%97700/?product")
end

puts 'Seed data has been created successfully.'
