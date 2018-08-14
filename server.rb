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

=begin  

# ! Additional features in the future
patch '/cart' do
    erb :cart
end

post '/checkout' do
    erb :checkout
end

=end

# Events API

get '/events' do 
    # params can replace the values here if I add a search bar feature on the page
    @query = 'baking-class'
    @location = 'brooklyn'
    response = HTTParty.get("https://www.eventbriteapi.com/v3/events/search/?q=#{@query}&location.address=#{@location}&token=#{ ENV[ 'API_KEY' ] }")
    @event_data = JSON.parse(response.body)
    @events = @event_data['events'].first(5)

    erb :events
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

    attr_accessor :name, :desc, :price, :id, :images

    def initialize(name, desc, price)
        @id = @@count + 1
        @name = name
        @desc = desc
        @price = price
        @images = ''        
        @@count += 1
        add_to_cookies(self)
    end

    def add_description(detail)
        @desc << detail
    end

    def add_image(url)
        @images = url
    end

    def self.count
        @@count
    end

end

class Cake
    
    @@count = 0

    attr_accessor :name, :desc, :price, :id, :images
    def initialize(name, desc, price)
        @id = @@count + 1
        @name = name
        @desc = desc
        @price = price
        @images = ''
        @@count += 1
        add_to_cakes(self)
    end

    def add_description(detail)
        @desc << detail
    end

    def add_image(url)
        @images = url
    end

    def self.count
        @@count
    end
    
end

class Muffin
    
    @@count = 0

    attr_accessor :name, :desc, :price, :id, :images
    def initialize(name, desc, price)
        @id = @@count + 1
        @name = name
        @desc = desc
        @price = price
        @images = ''
        @@count += 1
        add_to_muffins(self)
    end

    def add_description(detail)
        @desc << detail
    end

    def add_image(url)
        @images = url
    end

    def self.count
        @@count
    end
    
end

# Creating Each Product 
# I could loop through this but I will need unique names for each. If there is a random name generator with flavors and price, would be splendid

@cookie1 = Cookie.new('Overload', ['milk chocolate', 'macadamia', 'marshmallows'], 4)
@cookie1.add_image('/images/overload.jpg')

@cookie2 = Cookie.new('Peanutty', ['Peanut Butter', 'Cashews'], 3)
@cookie2.add_image('/images/peanut-butter.jpg')

@cookie3 = Cookie.new('Mint Condition', ['Mint', 'Dark Chocolate'], 3)
@cookie3.add_image('/images/mint.jpg')

@cake1 = Cake.new('Dark Forest', ['Dark Chocolate', 'Coconut Flakes', 'Dulce De Leche'], 55)
@cake1.add_image('/images/dark-forest.jpg')

@cake2 = Cake.new('Passionate', ['Passion Fruit Mousse', 'Mango', 'Almonds'], 60)
@cake2.add_image('/images/passionate.jpg')

@cake3 = Cake.new('Red Winter', ['Strawberry Flan', 'Raspberries', 'Meringue'], 65)
@cake3.add_image('/images/red-winter.jpg')

@muffin1 = Muffin.new('Midnight', ['Dark Chocolate', 'Roasted Pecans'], 5)
@muffin1.add_image('/images/midnight.jpg')

@muffin2 = Muffin.new('Egged', ['Sweet Custard Filling', 'Toasted Eggnog', 'Soft Meringue'], 5)
@muffin2.add_image('/images/eggnog.jpeg')

@muffin3 = Muffin.new('Normal', ['Genoise', 'Chocolate Chips', 'Walnuts'], 4)
@muffin3.add_image('/images/normal.jpg')

