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
  letter=["c","b"]
  i=10
  10.times do 
    @bays << "a#{i}"
    i -= 1
  end
  letter.each do |letter|
    i=0
    10.times do 
      @bays << "#{letter}#{i+1}"
      i += 1
    end
  end

 # puts @products.keys
end

def add_item
  print "Please enter product name: "
  requested_product = gets.chomp.downcase
  @products.each do |bay, listed_product|
    if requested_product == listed_product
      @trolley << bay
      puts "Item added from bay #{bay}"
    end
  end
  menu
end

def list_items
  puts "Items Selected:"

  @trolley.each do |bay_no|

    item = @products[bay_no.to_sym]
    puts item

  end
  
  menu
end

def calculate_distance
  first_bay = @bays.size
  last_bay = 0
  @trolley.each do |bay_no|
    current = @bays.index(bay_no.to_s)
    if current < first_bay
      first_bay = current
    end
    if current > last_bay
      last_bay = current
    end
  end
  distance = last_bay - first_bay
  puts "Total distance walked: #{distance} steps!"
  
  menu
end

def list_order
  #sort @trolley by index of bays
  sorted_list = []
  @trolley.each do |bay_no|
    current = @bays.index(bay_no.to_s)
    sorted_list << current
  end
  sorted_list.sort!
  puts "You must visit:"
  sorted_list.each do |index|
    puts @bays[index]
  end
  menu
end

def menu

  puts "\n\n\nWhat would you like to do?"
  puts "Add items by (N)ame"
  puts "Add items by (B)ay"
  puts "(L)ist your items"
  puts "(D)isplay your route"
  puts "(C)alculate your distance\n"

  case answer = gets.chomp.downcase
  when "n"
    add_item
  when "b"
    reverse_lookup
  when "l"
    list_items
  when "d"
    list_order
  when "c"
    calculate_distance
  else
    menu
  end
end

def reverse_lookup
  puts "Enter bay number(s)"
  bay_no = gets.chomp
  bay_list = bay_no.split(", ")
  bay_list.each do |item|
    @trolley << item
  puts "Product added: #{@products[item.to_sym]}"
end
  menu
end

create_bays
#get_input
menu

#reverse_lookup



