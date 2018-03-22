Producer.destroy_all
User.destroy_all
Subcategory.destroy_all
Category.destroy_all



puts "Create User"

ant = User.create(first_name:"Antoine", last_name:"Guilguet", restaurant_name:"La Biche", email:"guilguet.antoine@gmail.com", password:"skate1", phone_number:"0808080880", siret:"0009090909090")
bat = User.create(first_name:"Batou", last_name:"Granclerc", restaurant_name:"Bateub",email:"baptiste.grandclerc@gmail.com", password:"skate2", phone_number:"0808080880", siret:"0009090909090")

puts "Create Producer"
# Producteurs
viltain = Producer.create(name:"Ferme de Viltain", address:"10 rue de la Gare", description: "Maraicher seine et marne", first_name: "Bob", last_name:"Léponge", phone_number:"0909090909", user_id: ant.id, photo:"http://res.cloudinary.com/dc2sgi2zs/image/upload/v1521051448/e2dt5ah7hm7olgj1d2zs.jpg")
fruitiere = Producer.create(name:"Fruitière de Granveaux", address:"10 rue de Saint Laurent", description: "Comté du Jura à foison", first_name: "Monsieur", last_name:"Propre", phone_number:"0707070707", user_id: bat.id, photo:"http://res.cloudinary.com/dc2sgi2zs/image/upload/v1521132220/grandveaux_exvnjg.jpg")
fr = Producer.create(name:"Fruitière de Mont de marsan", address:"10 rue de Saint Laurent", description: "Fromage de tous le pays de la bas", first_name: "Monsieur", last_name:"Propre", phone_number:"0707070707", user_id: bat.id, photo:"http://res.cloudinary.com/dc2sgi2zs/image/upload/v1521132220/grandveaux_exvnjg.jpg")
fr1 = Producer.create(name:"Fruitière de Genève", address:"10 rue de La gare", description: "Fromage suis sa mère", first_name: "Monsieur", last_name:"Propre", phone_number:"0707070707", user_id: bat.id, photo:"http://res.cloudinary.com/dc2sgi2zs/image/upload/v1521132220/grandveaux_exvnjg.jpg")
fr2 = Producer.create(name:"Fruitière de Bordeaux", address:"10 rue de la France", description: "Fromage là ou il y en a pas", first_name: "Monsieur", last_name:"Propre", phone_number:"0707070707", user_id: bat.id, photo:"http://res.cloudinary.com/dc2sgi2zs/image/upload/v1521132220/grandveaux_exvnjg.jpg")
fr3 = Producer.create(name:"Fruitière de Marseille", address:"10 rue du parking", description: "Et ouiais morray", first_name: "Monsieur", last_name:"Propre", phone_number:"0707070707", user_id: bat.id, photo:"http://res.cloudinary.com/dc2sgi2zs/image/upload/v1521132220/grandveaux_exvnjg.jpg")

puts "Create Supplier"
Supplier.create(user_id: ant.id, producer_id: viltain.id)
Supplier.create(user_id: ant.id, producer_id: fruitiere.id)
Supplier.create(user_id: bat.id, producer_id: viltain.id)

puts "Create Category"
# Category
fro = Category.create(name:"Fromager")
mar = Category.create(name:"Maraîcher")
cre = Category.create(name:"Crémier")
char = Category.create(name:"Charcuterie")

puts "Create Activity"
# Activities
Activity.create(category_id: fro.id, producer_id: fr.id)
Activity.create(category_id: fro.id, producer_id: fr1.id)
Activity.create(category_id: fro.id, producer_id: fr2.id)
Activity.create(category_id: fro.id, producer_id: fr3.id)
Activity.create(category_id: cre.id, producer_id: fruitiere.id)
Activity.create(category_id: mar.id, producer_id: viltain.id)
Activity.create(category_id: cre.id, producer_id: viltain.id)

puts "Create Subcategory"
# Subcategories
vache = Subcategory.create(name: "Lait de Vache", category_id: fro.id)
chevre = Subcategory.create(name: "Lait de Chèvre", category_id: fro.id)
brebis = Subcategory.create(name: "Lait de Brebis", category_id: fro.id)
entier = Subcategory.create(name: "Lait Entier", category_id: cre.id)
demi = Subcategory.create(name: "Lait demi-écrémé", category_id: cre.id)
beurre = Subcategory.create(name: "Beurre", category_id: cre.id)
fruits = Subcategory.create(name: "Fruits", category_id: mar.id)
legumes = Subcategory.create(name: "Légumes", category_id: mar.id)
saucisson = Subcategory.create(name: "Saucissons", category_id: char.id)


puts "Create Products"
# Products
Product.create(conditionning: "Sachet", bio: false, composition:"Nice", name:"Salade", description:"Salade fraîche et délicieuse", price: 1.5, producer_id: viltain.id, origin: "France", quantity: 200, unit: "g", subcategory_id: legumes.id)
Product.create(conditionning: "Sac", label: "bio", bio:false, composition:"ijifjaijeifj", name:"Tomate", description:"Tomate du jardin", price: 2, producer_id: viltain.id, origin: "France", quantity: 100, unit: "g", subcategory_id: fruits.id)
Product.create(conditionning: "Sac", label: "bio", bio:false, composition:"nice composition", name:"Concombre", description:"Grand concombre délicieux", price: 2.4, producer_id: viltain.id, origin:"France", quantity: 200, unit: "g", subcategory_id: legumes.id)
Product.create(conditionning: "Sac", label: "bio", bio:false, composition:"nice composition", name:"Orange", description:"Orange juteuse", price: 1.5, producer_id: viltain.id, origin:"France", quantity: 200, unit: "g", subcategory_id: fruits.id)
Product.create(conditionning: "Sac", label: "bio", bio:false, composition:"nice composition", name:"Banane", description:"Banane savoureuse", price: 1.5, producer_id: viltain.id, origin:"France", quantity: 200,unit:"g", subcategory_id: fruits.id)
Product.create(conditionning: "Sac", label: "bio", bio:false, composition:"nice composition", name:"Pêche", description:"Pêche du Sud", price: 3, producer_id: viltain.id, origin:"Espagne", quantity: 200, unit: "g", subcategory_id: fruits.id)
Product.create(conditionning: "Sac", label: "bio", bio:false, composition:"nice composition", name:"Fromage de chèvre", description:"Savoureux et onctueux", price: 5, producer_id: viltain.id, origin:"Espagne", quantity: 200, unit: "g", subcategory_id: chevre.id)
Product.create(conditionning: "Sac", label: "bio", bio:false, composition:"nice composition", name:"Saucisson", description:"Délicieux sauce-back", price: 4, producer_id: viltain.id, origin:"Espagne", quantity: 300, unit: "g", subcategory_id: saucisson.id)
Product.create(conditionning: "Sac", label: "bio", bio:false, composition:"nice composition", name:"Courgette", description:"Courgette de la mère bastien", price: 15, producer_id: viltain.id, origin:"Espagne", quantity: 400, unit: "g", subcategory_id: legumes.id)
Product.create(conditionning: "Sac", label: "bio", bio:false, composition:"nice composition", name:"Poireaux", description:"Le vilain batou", price: 12, producer_id: viltain.id, origin:"Espagne", quantity: 1, unit: "kg", subcategory_id: legumes.id)

Product.create(conditionning: "Papier", label: "Comté du Jura" , bio:true, composition:"blallalijfhauehfuehau", name:"Comté Jeune", description:"12 mois d'affinage", price: 12, producer_id: fruitiere.id, origin:"France", quantity: 1, unit: "kg", subcategory_id: vache.id)
Product.create(conditionning: "Papier", label: "Comté du Jura" , bio:true, composition:"blallalijfhauehfuehau", name:"Comté Fruité", description:"16 mois d'affinage", price: 16, producer_id: fruitiere.id, origin:"France", quantity: 1, unit: "kg", subcategory_id: vache.id)
Product.create(conditionning: "Papier", label: "Comté du Jura" , bio:true, composition:"blallalijfhauehfuehau", name:"Comté Vieux", description:"24 mois d'affinage", price: 22, producer_id: fruitiere.id, origin:"France", quantity: 1, unit: "kg", subcategory_id: vache.id)
Product.create(conditionning: "Papier", label: "Morbier" , bio:true, composition:"blallalijfhauehfuehau", name:"Morbier Jeune", description:"8 mois d'affinage", price: 10, producer_id: fruitiere.id, origin:"France", quantity: 1, unit: "kg", subcategory_id: vache.id)
Product.create(conditionning: "Papier", label: "Jura" , bio:true, composition:"blallalijfhauehfuehau", name:"Bleu de Gex", description:"10 mois d'affinage", price: 9, producer_id: fruitiere.id, origin:"France", quantity: 1, unit: "kg", subcategory_id: vache.id)
Product.create(conditionning: "Papier", label: "Jura" , bio:true, composition:"blallalijfhauehfuehau", name:"Tomme de Granveaux", description:"16 mois d'affinage", price: 14, producer_id: fruitiere.id, origin:"France", quantity: 1, unit: "kg", subcategory_id: vache.id)