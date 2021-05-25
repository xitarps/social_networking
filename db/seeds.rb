# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create(name: 'Administrador', email:"admin@admin.com", password:'123admin')
puts 'Admin gerado com sucesso'

unless Rails.env.production?
  User.create(name: 'Sr User', email:'user@tester.com',
              password: '12345', phone: '11977777777', 
              avatar: Rack::Test::UploadedFile.new(Rails.root.join("spec", "support", "test-avatar.png"), "image/png"))
  puts 'Usuario criado com sucesso'
end