require 'date'

def prompt(description)
  puts "Please enter #{description}"
  gets.chomp
end

def error(code)
  puts "Error: #{code}"
end

def menu
  # Clear the screen, and present the user with a menu
  puts `clear`
  puts "*** Calc-U-L8R ***"
  puts "Please choose whether to keep it simple, or push the boundaries"
  print "(b)asic, (a)dvanced, a(g)e, (s)leeps, (m)etric or (v)olume or (q)uit: "
  prompt("Choice").downcase
end

def age
  birthyear = prompt("year: ").to_i
  birthmonth = prompt("month: ").to_i
  birthdate = prompt("date: ").to_i
  birthday = Date.new(birthyear,birthmonth,birthdate)
  now = Date.today

  #year = now.year - birthday.year
  year = (Date.today - birthday).to_i / 365
  puts "Your age is #{year}."
  gets

end

def sleeps
  now = Date.today
  xmas = Date.new(2015,12,25)

  sleeps = (xmas - now).to_i
  puts "Number of sleeps: #{sleeps}"
  gets
end

def metric
  puts "(c)m to inch"
  puts "(m) to feet"
  puts "(i)nches to cm"
  puts "(f)eet to m"
  selected = gets.chomp
  case selected
  when "c"
    multiplier = 0.3937
  when "m" 
    multiplier = 3.2808
  when "i"
    multiplier = 2.54
  when "f"
    multiplier = 0.3048
  end

  puts "Enter number:"
  input = gets.chomp.to_i

  answer = (input * multiplier)
  puts "The answer is #{answer}"
  gets
end

def volume
  puts "(c)ube"
  puts "(s)phere"

  puts "Please enter selection:"
  choice = gets.chomp
  case choice
  when "c"
    value = prompt("Enter length of face").to_f
    answer = value**3
  when "s"
    radius = prompt("Enter radius").to_f
    answer = (((radius**3)*4/3)*3.14)
  end
  puts "Your answer is #{answer}"
  gets
end

def basic_calc
  # ask the user which operation they want to perform
  puts "Good choice - which simple operation do you want to perform"
  print "(a)dd, (s)ubtract, (m)ultiply, (d)ivide: "
  operation = gets.chomp.downcase
  
  num1 = prompt("First Number").to_f
  num2 = prompt("Second Number").to_f

  case operation
  when 'a' 
    operator = :+
  when 's'
    operator = :-
  when 'm'
    operator = :*
  when 'd'
    if num2 == 0 then 
      error("can't divide by zero")
      num2=prompt("Re-enter second number").to_f
    end
    operator = :/
  end

  result = calculate(num1, num2, operator)

  print "Result: #{result}"

  # pause for a couple of seconds - but is this the best way of delaying sending the user back? What if they need more than two seconds to read the screen? (or less)
  wait = gets.chomp
end

def advanced_calc
  puts "Good choice - which simple operation do you want to perform"
  print "(s)quare root or (p)ower: "
  operation = gets.chomp.downcase
  
  num1 = prompt("A Number").to_i
 
  case operation
  when 's' 
    result =  Math.sqrt(num1)
  when 'p'
    num2 = prompt("Another Number").to_i
    result = num1 ** num2
  end

  print "Result: #{result}"

  # pause for a couple of seconds - but is this the best way of delaying sending the user back? What if they need more than two seconds to read the screen? (or less)
  puts "press enter to start again"
  sleep = gets
end

def calculate(num1, num2, operator)
  return num1.send(operator, num2)
end

# run the app...

response = menu

until response == 'q'
  case response
  when 'b'
    basic_calc
  when 'a'
    advanced_calc
  when 'g'
    age
  when 's'
    sleeps
  when 'm'
    metric
  when 'v'
    volume
  else
    error("please choose one of the options")
    sleep 2
  end
  response = menu
end
