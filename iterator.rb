def three_times
	yield
	yield
	yield
end
three_times { puts "Hello" }


def fib_up_to(max)
	i1, i2 = 1, 1
	while i1 <= max
		yield i1
		i1, i2 = i2, i1+i2
	end
end

fib_up_to(1000) {|f| print f, " "}
puts ""

a = [1, 2]
b = 'cat'
a.each {|b| c = b * a[1] }
a
b
defined?(c)


class Array
	def find
		for i in 0...size
			value = self[i]
			return value if yield(value)
		end
		return nil
	end
end

[1, 3, 5, 7, 9].find {|v| v*v > 30 }

[ 1, 3, 5, 7, 9 ].each {|i| puts i }

["H", "A", "L"].collect {|x| x.succ }


f = File.open("c:/testfile.txt")
f.each do |line|
	puts line
end
f.close


[1,3,5,7].inject(0) {|sum, element| sum+element}
[1,3,5,7].inject(1) {|product, element| product*element}


[1,3,5,7].inject {|sum, element| sum+element}
[1,3,5,7].inject {|product, element| product*element}


class File
	def File.open_and_process(*args)
		f = File.open(*args)
		yield f
		f.close()
	end
end

File.open_and_process("c:/testfile.txt", "r") do |file|
	while line = file.gets
		puts line
	end
end



class File
	def File.my_open(*args)
		result = file = File.new(*args)
		# If there's a block, pass in the file and close
		# the file when it returns
		if block_given?
			result = yield file
			file.close
		end
		
		return result
	end
end

start_button = Button.new("Start")
pause_button = Button.new("Pause")

class StartButton < Button
	def initialize
		super("Start") # invoke Button's initialize
	end
	def button_pressed
		# do start actions
	end
end

start_button = StartButton.new



songlist = SongList.new
class JukeboxButton < Button
	def initialize(label, &action)
		super(label)
		@action = action
	end
	
	def button_pressed
		@action.call(self)
	end
end

start_button = JukeboxButton.new("Start") { songlist.start }
pause_button = JukeboxButton.new("Pause") { songlist.pause }

def n_times(thing)
	return lambda {|n| thing * n }
end

p1 = n_times(23)
p1.call(3)
p1.call(4)
p2 = n_times("Hello ")
p2.call(3)

num = 81
6.times do
	puts "#{num.class}: #{num}"
	num *= num
end

123456
0d123456
123_456
-543
0xaabb
0377
-0b10_1010
123_456_789_123_456_789

?a
?\n
?\C-a
?\M-a
?\M-\C-a
?\C-?


3.times { print "X " }
1.upto(5) {|i| print i, " " }
99.downto(95) {|i| print i, " " }
50.step(80, 5) {|i| print i, " "}

some_file.each do |line|
	v1, v2 = line.split # split line on spaces
	print v1 + v2, " "
end

some_file.each do |line|
	v1, v2 = line.split
	print Integer(v1) + Integer(v2), " "
end


'escape using "\\"'
'That\'s right'


"Seconds/day: #{24*60*60}"
"#{'Ho! '*3}Merry Christmas!"
"This is line #$."


puts "now is #{def the(a)
					'the ' + a
				end
				the('time')
				}for all good coders..."




%q/general single-quoted string/
%Q!general double-quoted string!
%Q{Seconds/day: #{24*60*60}}

string = <<END_OF_STRING
	The body of the string
	is the input lines up to
	one ending with the same 
	text that followed the '<<'
END_OF_STRING


print <<-STRING1, <<-STRING2
	Concat
	STRING1
		enate
		STRING2











































































































































































































































































