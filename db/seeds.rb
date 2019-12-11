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
1.times { Butterfly.create!(butterfly_name: "cabbage", description: "Cabbage Butterfly, common name applied to the adult of the imported cabbageworm, a member of the whites and sulphers family of butterflies. The name is also loosely applied to several other related species whose caterpillars feed on plants in the mustard family. The cabbage and other related plants secrete a chemical to which the butterfly is attracted. The butterfly deposits eggs on the leaves, on which the larvae feed and grow to maturity. The infested foliage is toxic upon consumption by animals. About a dozen species that follow these habits are found in North America, the most destructive of which is the imported cabbage butterfly, a European species introduced into Canada about the middle of the 19th century and now common throughout the United States. The fully grown larva, or caterpillar, is about 4 cm (about 1.5 in) long and green with a lemon-yellow dorsal band. It not only eats the leaves of the plants before heading time but also burrows through the heads. The butterfly has a wingspan of about 3 cm (about 1.2 in). The tops of its wings are white; the forewings are tipped with black. The forewings of the female have two central black dots, and those of the male, one. The undersides of the wings are pale yellow. Related species include the large white, a European variety; and the southern cabbageworm butterfly, or checkered white, a common American variety. ") }
1.times { Butterfly.create!(butterfly_name: "ringlet", description: "The Ringlet is unmistakable when seen at rest - the rings on the hind wings giving this butterfly its common name. The upper sides are a uniform chocolate brown distinguishing this butterfly from the closely related Meadow Brown. Despite its uniformity, a newly emerged adult is a surprisingly beautiful insect, the velvety wings providing a striking contrast with the delicate white fringes found on the wing edges.") }
1.times { Butterfly.create!(butterfly_name: "sulphur", description: "The Clouded Sulphur is a species of small to medium-sized butterflies that are spread across much of North America. Theyare mostly seen on sunny days usually flying within a meter above the ground. Thecreature is abundantly spread across its habitat and has been marked by theIUCN 2.3 as ‘LC’ (Least Concern).") }
1.times { Butterfly.create!(butterfly_name: "milkweed", description: "It eats milkweed.") }


