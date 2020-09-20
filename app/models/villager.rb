class Villager

    attr_accessor = :items
    attr_reader :name, :species, :personality
    @@all = []

    def initialize(name, species, personality)
        @name = name
        @species = species
        @personality = personality
        @items = []
        @@all << self
    end

    def self.all
        @@all
    end

    def self.find_by_personality
        personality_types = ["Uchi","Lazy","Jock","Snooty","Normal","Cranky","Peppy","Smug"]
        puts "What type of villager are you looking for?"
        puts personality_types
        choice = gets.chomp
        until personality_types.include?(choice)
            puts "Invalid personality type. Try again!"
            puts personality_types
            choice = gets.chomp
        end
        all_villagers = Villager.all.select{|villager| villager.personality == choice}
        puts "Great! Here are the villagers with the #{choice} personality:"
        all_villagers.each do |villager|
            puts "#{villager.name} (#{villager.species})"
        end
    end

    def self.find_by_species
        species_types = ["Cat","Hamster","Horse","Bear Cub","Rabbit","Frog","Duck","Octopus","Alligator"]
        puts "What type of villager are you looking for?"
        puts species_types
        choice = gets.chomp
        until species_types.include?(choice)
            puts "Invalid species type. Try again!"
            puts species_types
            choice = gets.chomp
        end
        all_villagers = Villager.all.select{|villager| villager.species == choice}
        puts "Great! Here are the #{choice} villagers:"
        all_villagers.each do |villager|
            puts "#{villager.name} (#{villager.personality})"
        end
    end

end