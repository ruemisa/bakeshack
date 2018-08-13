require 'sinatra'
require 'httparty'
require 'json'

# Global

$cookies = []
$cakes = []
$muffins = []

def add_to_cookies(cookie)
    $cookies << cookie
end

def add_to_cakes(cake)
    $cakes << cake
end

def add_to_muffins(muffin)
    $muffins << muffin
end


get '/' do
    @cookie1 = Cookie.new('Overload', ['milk chocolate', 'macadamia', 'marshmallows'], 4)
    @cookie2 = Cookie.new('Peanutty', ['Peanut Butter', 'Cashews'], 3)
    @cookie3 = Cookie.new('Mint Condition', ['Mint', 'Dark Chocolate'], 3)

    @cake1 = Cake.new('Dark Forest', ['Dark Chocolate', 'Coconut Flakes', 'Dulce De Leche'], 55)
    @cake2 = Cake.new('Passionate', ['Passion Fruit Mousse', 'Mango', 'Almonds'], 60)
    @cake3 = Cake.new('Red Winter', ['Strawberry Flan', 'Raspberries', 'Meringue'], 65)

    @muffin1 = Muffin.new('Midnight', ['Dark Chocolate', 'Roasted Pecans'], 5)
    @muffin2 = Muffin.new('Egged', ['Sweet Custard Filling', 'Toasted Eggnog', 'Soft Meringue'], 5)
    @muffin3 = Muffin.new('Normal', ['Genoise', 'Chocolate Chips', 'Walnuts'], 4)

    erb :home
end

get '/cookies' do
    
    erb :cookies
end

get '/cakes' do
    erb :cakes
end

get '/muffins' do
    erb :cakes
end

patch '/cart' do
    erb :cart
end

post '/checkout' do
    erb :checkout
end


# The Cart (Just in case I need it)

class Cart 

    attr_accessor :product, :quantity

    def initialize
        @product = []
        @quantity = []
    end

    def add_to_cart(product, quantity)
        @product << product
        @quantity << quantity
    end    

end

# The Products

class Cookie
    @@count = 0

    attr_accessor :name, :desc, :price, :id

    def initialize(name, desc, price)
        @id = @@count + 1
        @name = name
        @desc = desc
        @price = price
        @@count += 1
        add_to_cookies(self)
    end

    def add_description(detail)
        @desc << detail
    end

    def self.count
        @@count
    end

end

class Cake
    
    @@count = 0

    attr_accessor :name, :desc, :price, :id
    def initialize(name, desc, price)
        @id = @@count + 1
        @name = name
        @desc = desc
        @price = price
        @@count += 1
        add_to_cakes(self)
    end

    def add_description(detail)
        @desc << detail
    end

    def self.count
        @@count
    end
    
end

class Muffin
    
    @@count = 0

    attr_accessor :name, :desc, :price, :id
    def initialize(name, desc, price)
        @id = @@count + 1
        @name = name
        @desc = desc
        @price = price
        @@count += 1
        add_to_muffins(self)
    end

    def add_description(detail)
        @desc << detail
    end

    def self.count
        @@count
    end
    
end
