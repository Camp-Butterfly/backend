# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Image seed data
10.times { Image.create!(image_content: "image", latitude: "butterfly", longitude: "Knowhere") }


# Butterfly seed data
#1.times { Butterfly.create!(butterfly_name: "Brush-footed", scientific_name: "Nymphalidae", image_file_name: "brush-footed.png", description: "Brush-footed description.") }
#1.times { Butterfly.create!(butterfly_name: "Harvesters", scientific_name: "Miletinae", image_file_name: "harvests.png", description: "Harvesters description.") }
#1.times { Butterfly.create!(butterfly_name: "Metalmarks", scientific_name: "Riodinidae", image_file_name: "metalmarks.png", description: "Metalmarks description.") }
#1.times { Butterfly.create!(butterfly_name: "Parnassians/Swallowtails", scientific_name: "Papilionidae", image_file_name: "parnassians.png", description: "Parnassians/Swallowtails description.") }
#1.times { Butterfly.create!(butterfly_name: "Skippers", scientific_name: "Hesperiidae", image_file_name: "skippers.png", description: "Skippers description.") }