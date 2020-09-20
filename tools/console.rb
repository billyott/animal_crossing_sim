require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end


#sample villagers
katt = Villager.new("Katt","Cat","Uchi")
clay = Villager.new("Clay","Hamster","Lazy")
roscoe = Villager.new("Roscoe","Horse","Cranky")
cheri = Villager.new("Cheri","Bear Cub","Peppy")
bonbon = Villager.new("Bonbon","Rabbit","Peppy")
genji = Villager.new("Genji","Rabbit","Jock")
henry = Villager.new("Henry","Frog","Smug")
molly = Villager.new("Molly","Duck","Normal")
marina = Villager.new("Marina","Octopus","Normal")
alli = Villager.new("Alli","Alligator","Snooty")

#sample items
froggy_chair = Item.new("Froggy Chair",1500)
wooden_wall_clock = Item.new("Wooden Wall Clock",800)
retro_stereo = Item.new("Retro Stereo",2000)
cot = Item.new("Cot",600)
mum_cushion = Item.new("Mum Cushion",400)
paper_tiger = Item.new("Paper Tiger",300)
small_red_rug = Item.new("Small Red Rug",1000)


def create_player
    puts "Hello there! What's your name?"
    player_name = gets.chomp
    puts "Great, thank you, #{player_name}."
    Player.new(player_name)
end

def create_island(player)
    puts "So, where are you moving?"
    island_name = gets.chomp
    puts "#{island_name}, right? Let's get you booked on the next flight out!"
    Island.new(player,island_name)
end


current_player = create_player
current_island = create_island(current_player)


Pry.start


