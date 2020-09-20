class Player

    attr_accessor :wallet, :items, :hair_color
    attr_reader :name
    @@all = []

    def initialize(name)
        @name = name
        @wallet = 2000
        @hair_color = ["Black","Blonde","Blue","Green","Red","Brown"].sample
        @items = Item.all.sample(3)
        @@all << self
    end

    def self.all
        @@all
    end

    def island
        Island.all.find{|island| island.player == self}
    end

    def neighbors
        my_island = island
        my_island.villagers
    end

    def get_item(item)
        @items << item
    end

    def update_wallet(amount)
        @wallet += amount
    end

    def print_player_stats
        my_island = island
        my_neighbors = neighbors
        villager_names = my_neighbors.map{|villager| villager.name}
        puts "Name: #{@name}"
        puts "Island: #{my_island.name}"
        puts "Neighbors: #{villager_names}"
        puts "Wallet Amount: #{wallet} Bells"
        puts "Hair Color: #{hair_color}"
    end

    def update_hair_color
        hair_colors = ["Black","Blonde","Blue","Green","Red","Brown"]
        puts "Which hair color would you like?"
        puts hair_colors
        choice = gets.chomp
        until hair_colors.include?(choice)
            puts "Invalid hair color. Try again!"
            puts hair_colors
            choice = gets.chomp
        end
        @hair_color = choice
        puts "Confirmed! We dyed your hair #{choice}."
    end

    def sell_item
        item_names = @items.map{|item| item.name}
        puts "Which item would you like to sell?"
        item_names.each do |current_item|
            item_price = Item.all.find{|item| item.name == current_item}.sell_price
            # item_price = item_price.sell_price
            puts "#{current_item} - #{item_price} Bells"
        end
        choice = gets.chomp
        until item_names.include?(choice)
            puts "Invalid choice. Try again!"
            item_names.each do |current_item|
                item_price = Item.all.find{|item| item.name == current_item}
                item_price = item_price.sell_price
                puts "#{current_item} - #{item_price} Bells"
            end
            choice = gets.chomp
        end
        target_item = @items.find{|item| item.name == choice}  
        update_wallet(target_item.sell_price)
        @items.delete(target_item)
        puts "No prob! You sold #{choice} for #{target_item.sell_price}."  
    end

end