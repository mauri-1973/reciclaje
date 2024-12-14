# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'faker'

User.create(email: 'operador1@gmail.com', password: '291ABASD932', role: 0)
User.create(email: 'operador2@gmail.com', password: '931SDABA988', role: 0)
User.create(email: 'administrador@gmail.com', password: '999SDABA988', role: 1)

10.times do
    recycler = Recycler.create!(
      name: Faker::Name.name,
      phone: Faker::PhoneNumber.cell_phone,
      address: Faker::Address.street_address,
      email: Faker::Internet.email
    )
  
    # Asocia materiales a cada reciclador
    5.times do
      Material.create!(
        name: Faker::Commerce.material, # Nombre ficticio de material
        description: Faker::Lorem.sentence(word_count: 10), # Descripción breve
        recycler: recycler
      )
    end
  end