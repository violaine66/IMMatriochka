# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "Cleaning database..."
Experience.destroy_all
Reservation.destroy_all

puts "Creating experiences..."

experiences = [
  {
    nom: "Maison Bleue de Frida Kahlo",
    description: "La maison où Frida Kahlo a vécu et créé certaines de ses œuvres les plus célèbres.",
    prix: 15,
    adresse: "Coyoacán, Mexico City, Mexique",
    photo_url: "https://upload.wikimedia.org/wikipedia/commons/5/57/Frida_Kahlo_Casa_Azul.jpg"
  },
  {
    nom: "Laboratoire de Marie Curie",
    description: "Une reconstitution de son laboratoire où elle a découvert le radium.",
    prix: 20,
    adresse: "1 Rue Pierre et Marie Curie, 75005 Paris, France",
    photo_url: "https://upload.wikimedia.org/wikipedia/commons/1/1e/Marie_Curie_laboratory.jpg"
  },
  {
    nom: "Salon des suffragettes",
    description: "Un espace dédié à l'histoire des suffragettes et de leur lutte pour le droit de vote.",
    prix: 10,
    adresse: "27 Red Lion Square, Londres, Royaume-Uni",
    photo_url: "https://upload.wikimedia.org/wikipedia/commons/7/7f/Suffragette_parade%2C_Washington%2C_D.C._%28March_3%2C_1913%29.jpg"
  },
  {
    nom: "Cabinet de curiosités de Mary Shelley",
    description: "Une collection d'objets et de souvenirs liés à la vie et à l'œuvre de Mary Shelley.",
    prix: 30,
    adresse: "5 Abbey Churchyard, Bath, Royaume-Uni",
    photo_url: "https://upload.wikimedia.org/wikipedia/commons/d/d8/Mary_Wollstonecraft_Shelley_by_Rothwell_-_cropped.jpg"
  },
  {
    nom: "Café littéraire de Simone de Beauvoir",
    description: "Un lieu de rencontre pour les intellectuels et les artistes de l'époque.",
    prix: 5,
    adresse: "12 Rue Bonaparte, 75006 Paris, France",
    photo_url: "https://upload.wikimedia.org/wikipedia/commons/b/b2/Simone_de_Beauvoir2.jpg"
  },
  {
    nom: "Studio de danse de Josephine Baker",
    description: "L'endroit où Josephine Baker a répété et créé ses chorégraphies révolutionnaires.",
    prix: 15,
    adresse: "13 Rue du Chevalier-de-Saint-George, 75008 Paris, France",
    photo_url: "https://upload.wikimedia.org/wikipedia/commons/f/fa/Josephine_Baker_1940.jpg"
  },
  {
    nom: "Atelier de couture de Coco Chanel",
    description: "Le lieu où Coco Chanel a conçu ses célèbres créations de mode.",
    prix: 20,
    adresse: "31 Rue Cambon, 75001 Paris, France",
    photo_url: "https://upload.wikimedia.org/wikipedia/commons/e/e8/Coco_Chanel_1920.jpg"
  },
  {
    nom: "Cabinet de travail d'Agatha Christie",
    description: "L'endroit où Agatha Christie a écrit certains de ses romans policiers les plus célèbres.",
    prix: 10,
    adresse: "Greenway House, Devon, Royaume-Uni",
    photo_url: "https://upload.wikimedia.org/wikipedia/commons/5/56/Agatha_Christie.png"
  },
  {
    nom: "Cabinet de travail de Maya Angelou",
    description: "L'endroit où Maya Angelou a écrit ses mémoires et ses poèmes les plus célèbres.",
    prix: 25,
    adresse: "1216 East Randolph Road, Winston-Salem, Caroline du Nord, USA",
    photo_url: "https://upload.wikimedia.org/wikipedia/commons/b/b4/Maya_Angelou_2013.jpg"
  },
  {
    nom: "Studio de cinéma d'Audrey Hepburn",
    description: "L'endroit où Audrey Hepburn a tourné certains de ses films les plus célèbres.",
    prix: 30,
    adresse: "Cinecittà Studios, Rome, Italie",
    photo_url: "https://upload.wikimedia.org/wikipedia/commons/1/14/Audrey_Hepburn_1956.jpg"
  },
  {
    nom: "Atelier de peinture de Georgia O'Keeffe",
    description: "L'endroit où Georgia O'Keeffe a créé ses célèbres peintures de fleurs et de paysages.",
    prix: 5,
    adresse: "Ghost Ranch, Abiquiú, Nouveau-Mexique, USA",
    photo_url: "https://upload.wikimedia.org/wikipedia/commons/4/44/Georgia_O%27Keeffe_1918.jpg"
  },
  {
    nom: "Simone Weil – Bibliothèque personnelle",
    description: "Une collection de livres et de manuscrits appartenant à la philosophe et mystique Simone Weil.",
    prix: 15,
    adresse: "9 Rue Auguste Comte, 69002 Lyon, France",
    photo_url: "https://upload.wikimedia.org/wikipedia/commons/7/75/Simone_Weil.jpg"
  },
  {
    nom: "Atelier de sculpture de Camille Claudel",
    description: "L'endroit où Camille Claudel a créé ses sculptures les plus célèbres.",
    prix: 20,
    adresse: "10 Rue de l'Hermitage, Nogent-sur-Seine, France",
    photo_url: "https://upload.wikimedia.org/wikipedia/commons/5/52/Camille_Claudel.jpg"
  },
  {
    nom: "Cabinet de travail de Virginia Woolf",
    description: "L'endroit où Virginia Woolf a écrit certains de ses romans les plus célèbres.",
    prix: 10,
    adresse: "Monk's House, Rodmell, Sussex, Royaume-Uni",
    photo_url: "https://upload.wikimedia.org/wikipedia/commons/0/0b/Virginia_Woolf_1902.jpg"
  },
  {
    nom: "Simone Veil – Bureau de magistrat",
    description: "Le bureau où Simone Veil a travaillé en tant que magistrate et avocate.",
    prix: 30,
    adresse: "5 Quai de l’Horloge, 75001 Paris, France",
    photo_url: "https://upload.wikimedia.org/wikipedia/commons/7/7b/Simone_Veil_2008.jpg"
  },
  {
    nom: "Atelier de photographie d'Annie Leibovitz",
    description: "L'endroit où Annie Leibovitz a pris certaines de ses photos les plus célèbres.",
    prix: 5,
    adresse: "190 Bowery, New York, USA",
    photo_url: "https://upload.wikimedia.org/wikipedia/commons/e/e5/Annie_Leibovitz.jpg"
  },
  {
    nom: "Cabinet de travail de Rosa Parks",
    description: "L'endroit où Rosa Parks a rédigé sa lettre de protestation contre la ségrégation raciale.",
    prix: 20,
    adresse: "252 Montgomery Street, Montgomery, Alabama, USA",
    photo_url: "https://upload.wikimedia.org/wikipedia/commons/f/f5/Rosa_Parks_1955-12-01.jpg"
  }
]



experiences.each do |experience|
  Experience.create!(experience)
end

puts "Experiences created successfully!"
