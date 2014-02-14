class Periods
	def each
		yield "Classical"
		yield "Jazz"
		yield "Rock"
	end
end


periods = Periods.new

for genre in periods do
	print genre, " "
end

puts

periods.each {|genre| print genre, " " }

puts

periods.each do |genre|
	print "#{genre} "
end

puts

for genre in periods
	print genre, " "
end