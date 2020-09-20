class Island

    attr_accessor :villagers, :season
    attr_reader :player, :name, :native_fruit
    @@all = []

    def initialize(player,name)
        @player = player
        @name = name
        @season = "fall"
        @native_fruit = ["apple","pear","cherry","peach","orange"].sample
        @villagers = Villager.all.sample(2)
        @@all << self
    end

    def self.all
        @@all
    end

    def print_island_stats
        villager_names = @villagers.map{|villager| villager.name}
        puts "Island: #{@name}"
        puts "Player: #{@player.name}"
        puts "Villagers: #{villager_names}"
        puts "Native Fruit: #{@native_fruit}"
        puts "Current Season: #{@season}"
    end

    def update_season
        seasons = ["winter","spring","summer","fall"]
        puts "Please enter the new season:"
        new_season = gets.chomp.downcase
        until seasons.include?(new_season)
            puts "Sorry, I didn't catch that. Which season did you want?" 
            new_season = gets.chomp.downcase
        end
        puts "Great! Season is now #{new_season}."
        @season = new_season
    end

    def move_villager(villager)
        @villagers << villager
    end

end