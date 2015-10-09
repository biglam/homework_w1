require 'pry-byebug'

@products = {
  :a3 => "blouse"       ,
  :a7 => "bookmark"     ,
  :c8 => "candy wrapper",
  :c3 => "chalk"        ,
  :b10 => "cookie jar"   ,
  :b9 => "deodorant"    ,
  :c2 => "drill press"  ,
  :c6 => "face wash"    ,
  :a9 => "glow stick"   ,
  :a4 => "hanger"       ,
  :c10 => "leg warmers"  ,
  :a8 => "model car"    ,
  :b5 => "nail filer"   ,
  :a1 => "needle"       ,
  :c7 => "paint brush"  ,
  :b4 => "photo album"  ,
  :b3 => "picture frame",
  :a10 => "rubber band"  ,
  :a5 => "rubber duck",
  :c1 => "rusty nail" ,
  :b2 => "sharpie"    ,
  :c9 => "shoe lace"  ,
  :a6 => "shovel"     ,
  :a2 => "stop sign"  ,
  :c5 => "thermometer",
  :b1 => "tire swing" ,
  :b8 => "tissue box" ,
  :b6 => "tooth paste",
  :c4 => "word search"
}

@bays = []
@trolley = []

def create_bays
  letter=["a","c","b"]
  letter.each do |letter|
    i=10
    10.times do 
      @bays << "#{letter}#{i}"
      i -= 1
    end
  end
end

def get_input
  shopping = "yes"
  until shopping == "no"
    add_item
    puts "Add another item?"
    shopping = gets.chomp
  end
end


def add_item
  puts "Please enter product name:"
  requested_product = gets.chomp
  @products.each do |bay, listed_product|
    if requested_product == listed_product
      @trolley << bay
    end
  end
end

def calculate_distance
  first_bay = 30
  last_bay = 0

  @trolley.each do |bay_no|
    current = @bays.index(bay_no.to_s)
    puts "Index: #{current}"
    binding.pry
    if current < first_bay
      first_bay = current
    end
    if current > last_bay
      last_bay = current
    end
  end
  distance = last_bay - first_bay
  puts "Total distance walked: #{distance} steps!"
end

create_bays
get_input
calculate_distance


#binding.pry
puts "test"


