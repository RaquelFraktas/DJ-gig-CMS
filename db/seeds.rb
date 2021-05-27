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

@spicy = Dj.create(name:"DJ Spicy Cement", username:"1spicyboi", password:"helloworld",bio: "I'll break the floor with my really niche finds.", based_in:"Brooklyn")
@kellya = Dj.create(name:"Kellya", username:"kellyadj", password:"helloworld",bio: "Full of surprises. For the oldheads", based_in:"Brooklyn")
@CNC = Promoter.create(name: "Reconstruct", based_in: "Brooklyn", username: "Recon", password: "helloworld")
@sheepshead = Promoter.create(name: "NewtypeRhythms", based_in: "Brooklyn", username: "newtyperhythms", password: "helloworld")
puts "successfully seeded"