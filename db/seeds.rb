# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Image seed data
# 10.times { Image.create!(image_content: "image", latitude: "butterfly", longitude: "Knowhere") }


# Butterfly seed data
1.times { Butterfly.create!(butterfly_name: "cabbage", description: "It eats milkweed.") }
1.times { Butterfly.create!(butterfly_name: "ringlet", description: "The Ringlet is unmistakable when seen at rest - the rings on the hind wings giving this butterfly its common name. The upper sides are a uniform chocolate brown distinguishing this butterfly from the closely related Meadow Brown. Despite its uniformity, a newly emerged adult is a surprisingly beautiful insect, the velvety wings providing a striking contrast with the delicate white fringes found on the wing edges.") }
1.times { Butterfly.create!(butterfly_name: "sulphur", description: "The Clouded Sulphur is a species of small to medium-sized butterflies that are spread across much of North America. Theyare mostly seen on sunny days usually flying within a meter above the ground. Thecreature is abundantly spread across its habitat and has been marked by theIUCN 2.3 as ‘LC’ (Least Concern).") }
1.times { Butterfly.create!(butterfly_name: "milkweed", description: " ") }


