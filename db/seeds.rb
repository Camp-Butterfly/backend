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
1.times { Butterfly.create!(butterfly_name: "brush_footed", scientific_name: "nymphalidae", image_file_name: "brush-footed.png", description: "Brush-footed description.") }
1.times { Butterfly.create!(butterfly_name: "harvesters", scientific_name: "miletinae", image_file_name: "harvests.png", description: "Harvesters description.") }
1.times { Butterfly.create!(butterfly_name: "metalmarks", scientific_name: "riodinidae", image_file_name: "metalmarks.png", description: "Metalmarks description.") }
1.times { Butterfly.create!(butterfly_name: "parnassians", scientific_name: "papilionidae", image_file_name: "parnassians.png", description: "Parnassians/Swallowtails description.") }
1.times { Butterfly.create!(butterfly_name: "skippers", scientific_name: "hesperiidae", image_file_name: "skippers.png", description: "Skippers description.") }