#! /usr/local/bin/ruby -w
#!/usr/bin/env ruby
3.times { puts "Hello!" }
"gin joint".length
"Rick".index("c")
-1942.abs

def say_goodnight(name)
	result = "Good night, " + name
	return result
end

puts say_goodnight("John-Boy")
puts say_goodnight("Mary-Ellen")
puts(say_goodnight("John-Boy"))

puts "Hello, \nworld"
puts 'Hello, \nworld'

def say_goodnight(name)
	result = "Good night, #{name}"
	return result
end

puts say_goodnight("Reevs-Lee")
puts say_goodnight('Pa')

def say_goodnight(name)
	result = "Goog night, #{name.capitalize}"
	return result
end

puts say_goodnight('uncle')

$greeting = "Hello"
@name = "Prudence"
puts "#$greeting,#$name"

def say_goodnight(name)
	"Good night, #{name}"
end

puts say_goodnight('Ma')


a = [1, 'Cat', 3.14]
a[0]
a[2] = nil
a


a = ['ant', 'bee', 'cat', 'dog', 'elk']
a[0]
a[3]

a = %w{ant bee cat dog elk}
a[0]
a[3]


inst_section = {
	'cello' => 'string',
	'clarinet' => 'woodwind',
	'drum' => 'percussion',
	'oboe' => 'woodwind',
	'trumpet' => 'brass',
	'violin' => 'string'
}

inst_section['oboe']
inst_section['cello']
inst_section['bassoon']


histogram = Hash.new(0)
histogram['key1']
histogram['key1'] = histogram['key1'] + 1
histogram['key1']

if count > 10
	puts "Try again"
elsif tries == 3
	puts "You lose"
else
	puts "Enter a number"
end

while weight < 100 and num_pallets <= 30
	pallet = next_pallet()
	weight += pallet.weight
	num_pallets += 1


while line = gets
	puts line.downcase
end

if radiation > 3000
	puts "Danger, Will Robinson"
end

puts "Danger, While Robinson" if radiation > 3000


square = 2
while square < 1000
	square = square * square
end

square = 2
square = square*square while square < 1000

/Perl|Python/
/P(erl|ython)/
/ab+c/
/ab*c/
/\d\d:\d\d:\d\d/
/Perl.*Python/
/Perl Python/
/Perl *Python/
/Perl +Python/
/Perl\s+Python/
/Ruby (Perl|Python)/

if line =~ /Perl|Python/
	puts "Scripting language mentioned: #{line}"
end

line.sub(/Perl/, 'Ruby')
line.gsub(/Python/, 'Ruby')

line.gsub(/Perl|Python/, 'Ruby')

{ puts "Hello" }
do
	club.enroll(person)
	person.socialize
end


greet { puts "Hi" }

verbose_greet("Dave", "loyal customer") { puts "Hi" }

def call_block
	puts "Start of method"
	yield
	yield
	puts "End of method"
end

call_block { puts "In the block" }

def call_block
	yield("Hello", 99)
end

call_block {|str, num| ...}

animals = %w{ ant bee cat dog elk }
animals.each {|animal| puts animal}

def each
	for each element
		yield(element)
	end
end

[ 'cat', 'dog', 'horse' ].each {|name| print name, " " }
5.times { print "*" }
3.upto(6) {|i| print i }
('a'..'e').each {|char| print char }

[1,2,3,4,5].each do | number |
	puts number
end

[1,2,3,4,5].each { |number |
	puts number
}

def call_block_without_argument
	yield
end


call_block_without_argument { puts "Hello Block" }

multiply = Proc.new { | a,b | puts a * b }
multiply.call(3, 4) # print out 12



def multiply_with( factor )
	return Proc.new { |number| number * factor }
end

multiply_with_10 = multiply_with(10)
multiply_with_10.call(12)


def print_with_postfix( postfix )
	return Proc.new { |printing_content| puts "#{printing_content} #{postfix}" }
end

print_with_postfix_bye = print_with_postfix( "bye" )
print_with_postfix_end = print_with_postfix( "end" )

def print_content( content, print_style )
	print_style.call( content )
end

print_content( "Hello world", print_with_postfix_bye)
print_content( "Hello world", print_with_postfix_end)


multiply_with_10 = Proc.new { | number | puts number * 10 }

[1,2,3,4].each(&multiply_with_10)

multiply_lambda_proc = lambda { |x, y| x * y }
multiply_lambda_proc.call( 3, 4 )



multiply_lambda_proc = lambda { | x, y | x * y }
multiply_proc = Proc.new { | x, y | x * y }

multiply_lambda_proc.call( 3, 4, 5 ) # ArgumentError: wrong number of arguments (3 for 2)
multiply_proc( 3, 4, 5 ) # return 12 as normal

# This last command's error shows that Proc auto assigns missing argument with nil
multiply_proc( 3 )  # TypeError: nil can't be coerced into Fixnum


def return_from_proc
      ruby_proc = Proc.new { return "return from a Proc" }
      ruby_proc.call
      return "The function will NOT reach here because a Proc containing a return statement has been called"
end

def return_from_lambda
      ruby_lambda = lambda { return "return from lambda" }
      ruby_lambda.call
      return "The function will reach here"
end

puts return_from_proc # display return from proc
puts return_from_lambda # display The function will reach here


arr = [1,2,3,4,5]
arr.each{|item| puts item}

a_proc = Proc.new {|a,*b| b.collect {|i| i*a}}
a_proc.call(9,1,2,3,4)


def proc_from
	Proc.new
end

proc = proc_from { "hello" }
proc.call


def gen_times(factor)
	return Proc.new {|n| n*factor}
end

times3 = gen_times(3)
times5 = gen_times(5)

times3.call(12)
times5.call(5)
times3.call(times5.call(4))


a_lambda = lambda {|a| puts a}
a_lambda.call("samsam")


a_lambda.class

def foo
	f = Proc.new {return "return from foo from inside proc"}
	f.call
	return "return from foo"
end

def bar
	f = lambda {return "return from lambda"}
	puts f.call
	return "return from bar"
end

puts foo

puts bar

printf("Number: %5.2f,\nString: %s\n", 1.23, "Hello")


line = gets
print line


while gets
	if /Ruby/
		print
	end
end

ARGF.each {|line| print line if line ~= /Ruby/ }
print ARGF.grep(/Ruby/)


class Song
	def initialize(name, artist, duration)
		@name = name
		@artist = artist
		@duration = duration
	end
end

song = Song.new("Bicyclops", "Fleck", 260)
song.inspect


class Song
	def to_s
		"Song: #@name--#@artist (#@duration)"
	end
end

song = Song.new("Bicyclops", "Fleck", 260)
song.to_s

class KaraokeSong < Song
	def initialize(name, artist, duration, lyrics)
		super(name, artist, duration)
		@lyrics = lyrics
	end
end

song = KaraokeSong.new("My Way", "Sinatra", 225, "And now, the...")
song.to_s


class KaraokeSong
	# ...
	def to_s
		"KS: #@name--#@artist (#@duration) [#@lyrics]"
	end
end
song.to_s


class KaraokeSong < Song
	# Format ourselves as a string by appending
	# our lyrics to our parent's #to_s value.
	def to_s
		super + " [#@lyrics]"
	end
end

song = KaraokeSong.new("My Way", "Sinatra", 225, "And now, the...")
song.to_s


class Song
	def name
		@name
	end
	def artist
		@artist
	end
	def duration
		@duration
	end
end

song = Song.new("Bicyclops", "Fleck", 260)
song.artist
song.name
song.duration

class Song
	attr_reader :name, :artist, :duration
end

class Song
	def duration=(new_duration)
		@duration = new_duration
	end
end

song = Song.new("Bicyclops", "Fleck", 260)
song.duration
song.duration = 257
song.duration



class Song
	attr_writer :duration
end

song = Song.new("Bicyclops", "Fleck", 260)
song.duration = 257



class Song
	def duration_in_minutes
		@duration/60.0 # force floating point
	end
	def duration_in_minutes=(new_duration)
		@duration = (new_duration*60).to_i
	end
end

song = Song.new("Bicyclops", "Fleck", 260)
song.duration_in_minutes
song.duration_in_minutes = 4.2
song.duration


class Song
	@@plays = 0
	def initialize(name, artist, duration)
		@name = name
		@artist = artist
		@duration = duration
		@plays = 0
	end
	def play
		@plays += 1 #same as @plays = @plays + 1
		@@plays += 1
		"This song: #@plays plays. Total #@@plays plays."
	end
end

s1 = Song.new("Song1", "Artist1", 234) # test songs..
s2 = Song.new("Song2", "Artist2", 345)
s1.play
s2.play
s1.play
s1.play

song = Song.new(....)
File.delete("dommed.txt")


class Example
	def instance_method # instance method
	end
	def Example.class_method # class method
	end
end


class SongList
	MAX_TIME = 5*60 # 5 minutes
	
	def SongList.is_too_long(song)
		return song.duration > MAX_TIME
	end
end

song1 = Song.new("Bicyclops", "Fleck", 260)
SongList.is_too_long(song1)
song2 = Song.new("The Calling", "Santana", 468)
SongList.is_too_long(song2)


class MyLogger
	private_class_method :new
	@@logger = nil
	def MyLogger.create
		@@logger = new unless @@logger
		@@logger
	end
end


class Demo
	def Demo.meth1
		# ...
	end
	def self.meth2
		# ...
	end
	class <<self
		def meth3
			# ...
		end
	end
end

MyLogger.create.object_id

MyLogger.create.object_id

class Shape
	def initialize(num_sides, perimeter)
		# ...
	end
end

class Shape
	def Shape.triangle(side_length)
		Shape.new(3, side_length*3)
	end
	def Shape.square(side_length)
		Shape.new(4, side_length*4)
	end
end


class MyClass
	def method1 # default is 'public'
		#...
	end
  protected # subsequent methods will be 'protected'
	def method2 # will be 'protected'
		#...
	end
  private # subsequent methods will be 'private'
	def method3 # will be 'private'
		# ...
	end
  public # subsequent methods will be 'public'
	def method4 # and this will be 'public'
		#...
	end
end

class MyClass
	def method1
	end
	# ... and so on
	public :method1, :method4
	protected :method2
	private :method3
end


class Accounts
	def initialize(checking, savings)
		@checking = checking
		@savings = savings
	end
  private
	def debit(account, amount)
		account.balance -= amount
	end
	def credit(account, amount)
		account.balance += amount
	end
  public
	#...
	def transfer_to_savings(amount)
		debit(@checking, amount)
		credit(@savings, amount)
	end
	#...
end


class Account
	attr_reader :cleared_balance # accessor method ' cleared_balance'
	protected :cleared_balance # and make it protected
	def greater_balance_than(other)
		return @cleared_balance > other.cleared_balance
	end
end


person = "Tim"
person.object_id
person.class
person

person1 = "Tim"
person2 = person1

person1[0] = "J"
person1
person2


person1 = "Tim"
person2 = person1.dup
person1[0] = "J"
person1
person2

person1 = "Tim"
person2 = person1
person1.freeze # prevent modifications to the object
person2[0] = "J"


a = [ 3.1415926, "pie", 99 ]
a.class
a.length
a[0]
a[1]
a[2]
a[3]


b = Array.new
b.class
b.length
b[0] = "second"
b[1] = "array"
b

a = [ 1, 3, 5, 7, 9]
a[-1]
a[-2]
a[-99]

a = [ 1, 3, 5, 7, 9 ]
a[1, 3]
a[3, 1]
a[-3, 2]


a = [ 1, 3, 5, 7, 9 ]
a[1..3]
a[1...3]
a[3..3]
a[-3..-1]


a = [ 1, 3, 5, 7, 9 ]
a[1] = 'bat'
a[-3] = 'cat'
a[3] = [ 9, 8 ]
a[6] = 99


a = [ 1, 3, 5, 7, 9 ]
a[2, 2] = 'cat'
a[2, 0] = 'dog'
a[1, 1] = [ 9, 8, 7 ]
a[0..3] = []
a[5..6] = 99, 98


h = { 'dog' => 'canine', 'cat' => 'feline', 'donkey' => 'asinine' }
h.length
h['dog']
h['cow'] = 'bovine'
h[12] = 'dodecine'
h['cat'] = 99
h

class SongList
	def initialize
		@songs = Array.new
	end
end

class SongList
	def append(song)
		@songs.push(song)
		self
	end
end

class SongList
	def delete_first
		@songs.shift
	end
	def delete_last
		@songs.pop
	end
end

class SongList
	def [](index)
		@songs[index]
	end
end












































































































