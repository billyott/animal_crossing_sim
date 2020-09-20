class Item

    attr_accessor :name
    attr_reader :buy_price, :sell_price
    @@all = []

    def initialize(name,buy_price)
        @name = name
        @buy_price = buy_price
        @sell_price = buy_price/2
        @@all << self
    end

    def self.all
        @@all
    end


end