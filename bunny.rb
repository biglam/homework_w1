students = %w(Iwona Craig GraemeK Kathryn Kieran Peter Ere Chae Zsolt Simon Syed Neil GraemeS Keith Nevin)
students.shuffle!
groups = []

puts "Group size:"
max_people = gets.chomp.to_i
totalgroups = (students.size / max_people).floor

(0...totalgroups).each do |x|
groups << []
end

incrementer =0

students.each  do |student|
  #puts incrementer
  groups[incrementer] << student
  if incrementer == totalgroups-1
    incrementer = 0
  else
    incrementer = incrementer+1
  end
end

puts "Total groups #{totalgroups}"
groupnumber=0
groups.each do |group|
  groupnumber +=1
  puts "Group #{groupnumber} - #{group}"
end
#puts incrementer
#puts groups