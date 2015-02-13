current_time = Time.new
formatted_time = current_time.strftime("on %A %m/%d/%Y at %I:%M%p")
puts "The game started #{formatted_time}"

name1 = 'larry'
health1 = 60

name2 = 'curly'
health2 = 125

puts "#{name1.capitalize} has a health of #{health1}."
puts "#{name2.upcase} has a health of #{health2}."

health2 = health1
puts "#{name2.upcase} has a health of #{health2}"

health1 = 30
puts "#{name1.capitalize} has a health of #{health1}."
puts "#{name2.upcase} has a health of #{health2}."

name3 = 'moe'
health3 = 100
text = "#{name3.capitalize} has a health of #{health3}."
puts player3.center(50, '*')

name4 = 'shemp'
health4 = 90
puts "#{name4.capitalize.ljust(50,'.')} #{health4} health"
