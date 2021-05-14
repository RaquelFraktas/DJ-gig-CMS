genres_list = 
"Deconstructed Club",
"Noise",
"Hyperpop",
"Footwork",
"Leftfield",
"IDM",
"Jungle",
"PC Music"


genres_list.each do |name|
  g = Genre.create(name: name)
  g.save
end

@spicy = Dj.create(name:"DJ Spicy Cement", username:"1spicyboi", password_digest:"helloworld",bio: "I'll set your party on fire with my really niche finds.", based_in:"Brooklyn")

puts "successfully seeded"