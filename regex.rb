def show_regexp(a, re)
	if a =~ re
		"#{$`}<<#{$&}>>#{$'}"
	else
		"no match"
	end
end

a = "The moon is made of cheese"

show_regexp(a, /\w+/)
show_regexp(a, /\s.*\s/)
show_regexp(a, /\s.*?\s/)
show_regexp(a, /[aeiou]{2,99}/)
show_regexp(a, /mo?o/)


a = "red ball blue sky"
show_regexp(a, /d|e/)
show_regexp(a, /al|lu/)
show_regexp(a, /red ball|angry sky/)


show_regexp('banana', /an*/)
show_regexp('banana', /(an)*/)
show_regexp('banana', /(an)+/)

a = 'red ball blue sky'
show_regexp(a, /blue|red/)
show_regexp(a, /(blue|red) \w+/)
show_regexp(a, /(red|blue) \w+/)
show_regexp(a, /red|blue \w+/)

show_regexp(a, /red (ball|angry) sky/)
a = 'the red angry sky'
show_regexp(a, /red (ball|angry) sky/)



"12:50am" =~ /(\d\d):(\d\d)(..)/
"Hour is #$1, minute #$2"

"12:50am" =~ /((\d\d):(\d\d))(..)/
"Time is #$1"
"Hour is #$2, minute #$3"
"AM/PM is #$4"


# match duplicated letter
show_regexp('He said "Hello"', /(\w)\1/)
# match duplicated substrings
show_regexp('Mississippi', /(\w+)\1/)


show_regexp('He said "Hello"', /(["']).*?\1/)
show_regexp("He said 'Hello'", /(["']).*?\1/)


a = "The quick brown fox"
a.sub(/[aeiou]/, '*')
a.gsub(/[aeiou]/, '*')
a.sub(/\s\S+/, '')
a.gsub(/\s\S+/, '')


a = "the quick brown fox"

a.sub(/^./) { |match| match.upcase }
a.gsub(/[aeiou]/) { |vowel| vowel.upcase }


def mixed_case(name)
	name.gsub(/\b\w/) { |first| first.upcase }
end


mixed_case("fats waller")
mixed_case("louis armstrong")
mixed_case("strength in numbers")


"fred:smith".sub(/(\w+):(\w+)/, '\2, \1')
"nercpyitno".gsub(/(.)(.)/, '\2\1')



str = 'a\b\c'

str.gsub(/\\/, '\\\\')
str.gsub(/\\/, '\\\\\\\\')
str.gsub(/\\/, '\&\&')
str.gsub(/\\/) { '\\\\' }



def unescapeHTML(string)
	str = string.dup
	str.gsub!(/&(.*?);/n) {
		match = $1.dup
		case match
			when /\Aamp\z/ni then '&'
			when /\Aquot\z/ni then '"'
			when /\Agt\z/ni then '>'
			when /\Alt\z/ni then '<'
			when /\A#(\d+)\z/ni then Integer($1).chr
			when /\A#x([0-9a-f]+)\z/ni then $1.hex.chr
		end
	}
	str
end

puts unescapeHTML("1&lt;2 &amp;&amp; 4&gt;3")
puts unescapeHTML("&quot;A&quot; = &#65; = &#x41;")



re = /cat/
re.class

re = /(\d+):(\d+)/ # match a time hh:mm
md = re.match("Time: 12:34am")
md.class
md[0] # == $&
md[1] # == $1
md[2] # == $2
md.pre_match # == $`
md.post_match # == $'


re = /(\d+):(\d+)/ # match a time hh:mm
md1 = re.match("Time: 12:34am")
md2 = re.match("Time: 10:30pm")
md1[1, 2]
md2[1, 2]


re = /(\d+):(\d+)/
md1 = re.match("Time: 12:34am")
md2 = re.match("Time: 10:30pm")

[ $1, $2 ] # last successful match
$~ = md1
[ $1, $2 ] # previous successful match

def my_new_method(arg1, arg2, arg3)		#3 arguments
	# Code for the method would go here
end

def my_other_new_method					# No arguments
	# Code for the method would go here
end



def cool_dude(arg1="Miles", arg2="Coltrane", arg3="Roach")
	"#{arg1}, #{arg2}, #{arg3}."
end

cool_dude
cool_dude("Bart")
cool_dude("Bart", "Elwood")
cool_dude("Bart", "Elwood", "Linus")


def varargs(arg1, *rest)
	"Got #{arg1} and #{rest.join(', ')}"
end

varargs("one")
varargs("one", "two")
varargs "one", "two", "three"


def take_block(p1)
	if block_given?
		yield(p1)
	else
		p1
	end
end

take_block("no block")
take_block("no block") { |s| s.sub(/no /, '') }



class TaxCalculator
	def initialize(name, &block)
		@name, @block = name, block
	end
	def get_tax(amount)
		"#@name on #{amount} = #{ @block.call(amount) }"
	end
end

tc = TaxCalculator.new("Sales tax") { |amt| amt * 0.075 }

tc.get_tax(100)
tc.get_tax(250)



connection.download_MP3("jitterbug") { |p| show_progress(p) }

File.size("testfile")
Math.sin(Math::PI/4)

self.class
self.frozen?
frozen?
self.object_id
object_id


a = obj.hash
a = obj.hash()

obj.some_method "Arg1", arg2, arg3
obj.some_method("Arg1", arg2, arg3)

def meth_one
	"one"
end

meth_one


def meth_two(arg)
	case
	when arg > 0
		"positive"
	when arg < 0
		"negative"
	else
		"zero"
	end
end


meth_two(23)
meth_two(0)

def meth_three
	100.times do |num|
		square = num*num
		return num, square if square > 1000
	end
end

meth_three

num, square = meth_three
num
square

	
def four(*args)
	#args.each do |num|
	#	puts num
	#end
	args.each { |num| puts num }
end

four(1,2,3,4,5,6,7)



def five(a, b, c, d, e)
	"I was passed #{a} #{b} #{c} #{d} #{e}"
end


five(1, 2, 3, 4, 5)
five(1, 2, 3, *['a', 'b'])
five(*(10..14).to_a)


list_bones("aardvark") do |bone|
	# ...
end


print "(t)imes or (p)lus:"
times = gets
print "number: "
number = Integer(gets)
if times =~ /^t/
	puts ((1..10).collect {|n| n*number }.join(", "))
else
	puts ((1..10).collect {|n| n+number }.join(", "))
end




print "(t)imes or (p)lus:"
times = gets
print "number: "
number = Integer(gets)
if times =~ /^t/
	calc = lambda {|n| n*number}
else
	calc = lambda {|n| n+number}
end

puts ((1..10).collect(&calc).join(", "))



class SongList
	def create_search(name, params)
		# ...
	end
end


list.create_search("short jazz songs", {
		'genre' => "jazz",
		'duration_less_than' => 270
	})

list.create_search("short jazz songs", 
		'genre' => "jazz",
		'duration_less_than' => 270
)


list.create_search("short jazz songs", 
		:genre => :jazz,
		:duration_less_than => 270
)


a = b = c = 0
[ 3, 1, 7, 0 ].sort.reverse

song_type = if song.mp3_type == MP3::Jazz
	if song.written < Date.new(1935, 1, 1)
		Song::TradJazz
	else
		Song::Jazz
	end
else
	Song::Other
end


rating = case votes_cast
when 0...10 then Rating::SkipThisOne
when 10...50 then Rating::CouldDoBetter
else Rating::Rave
end
	
		

(a.*(b)).+(c)


class Fixnum
	alias old_plus + # we can reference the original '+' as 'old_plus'

	# Redefine addition of Fixnums. This
	# is a BAD IDEA
	def +(other)
		old_plus(other).succ
	end
end

1 + 2
a = 3
a += 4
a + a + a


class Song
	def [](from_time, to_time)
		result = Song.new(self.title + " [extract]",
			self.artist,
			to_time - from_time)
		result.set_start_time(from_time)
		result
	end
end

`date`
`ls`.split[34]
%x{echo "Hello there"}


for i in 0..3
	status = `dbmanager status id=#{1}`
	# ...
end


alias old_backquote `
def `(cmd)
	result = old_backquote(cmd)
	if $? != 0
		fail "Command #{cmd} failed: #$?"
	end
	result
end

print `date`
print `data`


a = b = 1 + 2 + 3
a
b

a = (b = 1 + 2) + 3
a
b
File.open(name = gets.chomp)

instrument = 'piano'
MIDDLE_A = 440

song.duration = 234
instrument['ano'] = 'ccolo'


class Song
	def duration=(new_duration)
		@duration = new_duration
	end
end


class Amplifier
	def volume=(new_volume)
		self.left_channel = self.right_channel = new_volume
	end
end


class Test
	def val=(val)
		@val = val
		return 99
	end
end

t = Test.new
a = t.val = 2
a



#int a = 1;
#int b = 2
#int temp;
#temp = a;
#a = b;
#b = temp;

a, b = b, a


x = 0
a, b, c = x, (x += 1), (x += 1)



class BrokenAmplifier
	attr_accessor :left_channel, :right_channel
	def volume=(vol)
		left_channel = self.right_channel = vol
	end
end

ba = BrokenAmplifier.new
ba.left_channel = ba.right_channel = 99
ba.volume = 5
ba.left_channel
ba.right_channel


a = [1, 2, 3, 4]
b, c = a
b, *c = a
b, c = 99, a
b, *c = 99, a
b, c = 99, *a
b, *c = 99, *a

b, (c, d), e = 1,2,3,4
b, (c, d), e = [1,2,3,4]
b, (c, d), e = 1,[2,3],4
b, (c, d), e = 1,[2,3,4],5
b, (c, *d), e = 1,[2,3,4],5


class Bowdlerize
	def initialize(string)
		@value = string.gsub(/[aeiou]/, '*')
	end
	def +(other)
		Bowdlerize.new(self.to_s + other.to_s)
	end
	def to_s
		@value
	end
end

a = Bowdlerize.new("damn ")
a += "shame"




while line = gets
	#process line
end

defined? 1
defined? dummy
defined? printf
defined? String
defined? $_
defined? Math::PI
defined? a = 1
defined? 42.abs


nil and true
false and true
99 and false
99 and nil
99 and "cat"

false or nil
nil or false
99 or false


words[key] ||= []
words[key] << word


(words[key] ||= []) << word


if song,artist == "Gillespie" then
	handle = "Dizzy"
elsif song.artist == "Parker" then
	handle = "Bird"
else
	handle = "unknown"
end
	


if song,artist == "Gillespie"
	handle = "Dizzy"
elsif song.artist == "Parker"
	handle = "Bird"
else
	handle = "unknown"
end



if song,artist == "Gillespie" then handle = "Dizzy"
elsif song.artist == "Parker" then handle = "Bird"
else handle = "unknown"
end

if song,artist == "Gillespie": handle = "Dizzy"
elsif song.artist == "Parker": handle = "Bird"
else handle = "unknown"
end


handle = if song,artist == "Gillespie"
	"Dizzy"
elsif song.artist == "Parker"
	"Bird"
else
	"unknown"
end


unless song.duration > 180
	cost = 0.25
else
	cost = 0.35
end


cost = song.duration > 180 ? 0.35 : 0.25



mon, day, year = $1, $2, $3 if date =~ /(\d\d)-(\d\d)-(\d\d)/
puts "a = #{a}" if debug
print total unless total.zero?

File.foreach("/etc/fstab") do |line|
	next if line =~ /^#/	# Skip comments
	parse(line) unless =~ /^$/ # Don't parse empty lines
end

if artist == "John Coltrane"
	artist = "'Trane"
end unless use_nicknames == "no"


leap = case
	when year % 400 == 0: true
	when year % 100 == 0: false
	else year % 4 == 0
	end


case input_line
when "debug"
	dump_debug_info
	dump_symbols
when /p\s+(\w+)/
	dump_variable($1)
when "quit", "exit"
	exit
else
	print "Illegal command: #{input_line}"
end
	


kind = case year
when 1850..1889 then "Blues"
when 1890..1909 then "Ragtime"
when 1910..1929 then "New Orleans Jazz"
when 1930..1939 then "Swing"
when 1940..1950 then "Bebop"
else "Jazz"
end

kind = case year
when 1850..1889: "Blues"
when 1890..1909: "Ragtime"
when 1910..1929: "New Orleans Jazz"
when 1930..1939: "Swing"
when 1940..1950: "Bebop"
else "Jazz"
end


case line 
	when /title=(.*)/
		puts "Title is #$1"
	when /track=(.*)/
		puts "Track is #$1"
	when /artise=(.*)/
		puts "Artist is #$1"
end

		

case shape
when Square, Rectangle
	# ...
when Circle
	# ...
when Triangle
	# ...
else
	# ...
end



while line = gets
	# ...
end


until play_list.duration > 60
	play_list.add(song_list.pop)
end

a = 1
a *= 2 while a < 100
a -= 10 until a < 100
a



file = File.open("ordinal")
while line = file.gets
	puts(line) if line =~ /third/ .. line =~ /fifth/
end




file = File.open("ordinal")
while file.gets
	print if ~/third/ .. ~/fifth/
end



File.foreach("ordinal") do |line|
	if (($. == 1) || line =~ /eig/) .. (($. == 3) || line =~ /nin/)
		print line
	end
end


print "Hello\n" while false
	begin
		print "Goodbye\n"
	end while false


3.times do
	print "Ho! "
end

3.times {|i| print "#{i} "}

0.upto(9) do |x|
	print x, " "
end



0.step(12, 3) {|x| print x, " "}


[ 1, 1, 2, 3, 5 ].each {|val| print val, " " }


File.open("ordinal").grep(/d$/) do |line|
	puts line
end

loop do
	# block
end


for song in songlist
	song.play
end


songlist.each do |song|
	song.play
end


for i in ['fee', 'fi', 'fo', 'fum']
	print i, " "
end

for i in 1..3
	print i, " "
end


for i in File.open("ordinal").find_all {|line| line =~ /d$/}
	print i.chomp, " "
end


class Periods
	def each
		yield "Classical"
		yield "Jazz"
		yield "Rock"
	end
end

while line = gets
	next if line =~ /^\s*#/ # skip comments
	break if line =~ /^END/ # stop at end
							# substitute stuff in backticks and try again
	redo if line.gsub!(/'(.*?)'/) { eval($1) }
	# process line ...
end

i = 0
loop do
	i += 1
	next if i < 3
	print i
	break if i > 4
end


result = while line = gets
	break(line) if line =~ /answer/
end

process_answer(result) if result

for i in 1..100
	print "Now at #{1}. Restart? "
	retry if gets =~ /^y/i
end



def do_until(cond)
	break if cond
	yield
	retry
end
i = 0

do_until(i > 10) do
	print i, " "
	i += 1
end


[ 1, 2, 3 ].each do |x|
	y = x + 1
end
[ x, y ]



x = nil
y = nil

[ 1, 2, 3].each do |x|
	y = x + 1
end

[ x, y ]


if false
	a = 1
end

3.times {|i| a = i}


op_file = File.open(opfile_name, "w")
while data = socket.read(512)
	op_file.write(data)
end


op_file = File.open(opfile_name, "w")
begin
	while data = socket.read(512)
		op_file.write(data)
	end
rescue SystemCallError
	$stderr.print "IO failed: " + $!
	op_file.close()
	File.delete(opfile_name)
	raise
end


begin
	eval string
rescue SyntaxError, NameError => boom
	print "String doesn't compile: " + boom
rescue StandardError => boom
	print "Error running script: " + boom
end




f = File.open("testfile")
begin
	# .. process
rescue
	# .. handle error
ensure
	f.close unless f.nil?
end



f = File.open("testfile")
begin
	# .. 处理
rescue Exception => e
	
end




