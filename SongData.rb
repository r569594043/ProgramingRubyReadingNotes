File.open("songdata") do |song_file|
	songs = SongList.new
	song_file.each do |line|
		file, length, name, title = line.chomp.split(/\s*\|\s*/)
		name.squeeze!(" ")
		mins, secs = length.scan(/\d+/)
		songs.append(Song.new(title, name, mins.to_i*60+secs.to_i))
	end

	puts songs[1]
end


class WordIndex
	def initialize
		@index = {}
	end
	def add_to_index(obj, *phrases)
		phrases.each do |phrase|
			phrase.scan(/\w[-\w']+/) do |word| # extract each word
				word.downcase!
				@index[word] = [] if @index[word].nil?
				@index[word].push(obj)
			end
		end
	end
	def lookup(word)
		@index[word.downcase]
	end
end


class SongList
	def initialize
		@songs = Array.new
		@index = WordIndex.new
	end
	def append(song)
		@songs.push(song)
		@index.add_to_index(song, song.name, song.artist)
		self
	end
	def lookup(word)
		@index.lookup(word)
	end
end

songs = SongList.new
song_file.each do |line|
	file, length, name, title = line.chomp.split(/\s*\|\s*/)
	name.squeeze!(" ")
	mins, secs = length.scan(/\d+/)
	songs.append(Song.new(title, name, mins.to_i*60+secs.to_i))
end

puts songs.lookup("Fats")
puts songs.lookup("ain't")
puts songs.lookup("RED")
puts songs.lookup("WoRlD")


1..10
'a'..'z'
my_array = [ 1, 2, 3 ]
0...my_array.length

(1..10).to_a
('bar'..'bat').to_a

digits = 0..9
digits.include?(5
digits.min
digits.max
digits.reject {|i| i < 5 }
digits.each {|digit| dial(digit) }


class VU
	include Comparable
	attr :volume
	def initialize(volume) # 0..9
		@volume = volume
	end
	def inspect
		'#' * @volume
	end
	# Support for ranges
	def <=>(other)
		self.volume <=> other.volume
	end
	def succ
		raise(IndexError, "Volume too big") if @volume >= 9
		VU.new(@volume.succ)
	end
end

medium_volume = VU.new(4)..VU.new(7)
medium_volume.to_a
medium_volume.include?(VU.new(3))



while line = gets
	puts line if line =~ /start/ .. line =~ /end/
end

(1..10) === 5
(1..10) === 15
(1..10) === 3.14159
('a'..'j') === 'c'
('a'..'j') === 'z'


a = Regexp.new('^\s*[a-z]')
b = /^\s*[a-z]/
c = %r{^\s*[a-z]}


name = "Fats Waller"
name =~ /a/
name =~ /z/
/a/ =~ name



def show_regexp(a, re)
	if a =~ re
		"#{$`}<<#{$&}>>#{$'}"
	else
		"no match"
	end
end

show_regexp('very interesting', /t/)
show_regexp('Fats Waller', /a/)
show_regexp('Fats Waller', /ll/)
show_regexp('Fats Waller', /z/)


show_regexp('kangaroo', /angar/)
show_regexp('!@%&-_=+', /%&/)



show_regexp('yes | no', /\|/)
show_regexp('yes (no)', /\(no\)/)
show_regexp('are you sure?', /e\?/)


show_regexp("this is\nthe time", /^the/)
show_regexp("this is\nthe time", /is$/)
show_regexp("this is\nthe time", /\Athis/)
show_regexp("this is\nthe time", /\Athe/)


show_regexp("this is\nthe time", /\bis/)
show_regexp("this is\nthe time", /\Bis/)


show_regexp('Price $12.', /[aeiou]/)
show_regexp('Price $12.', /[\s]/)
show_regexp('Price $12.', /[[:digit:]]/)
show_regexp('Price $12.', /[[:space:]]/)
show_regexp('Price $12.', /[[:punct:]aeiou]/)

a = 'see [Design Patterns-page 123]'
show_regexp(a, /[A-F]/)
show_regexp(a, /[A-Fa-f]/)
show_regexp(a, /[0-9]/)
show_regexp(a, /[0-9][0-9]/)


a = 'see [Design Patterns-page 123]'
show_regexp(a, /[]]/)
show_regexp(a, /[-]/)
show_regexp(a, /[^a-z]/)
show_regexp(a, /[^a-z\s]/)


show_regexp('It costs $12.', /\s/)
show_regexp('It costs $12.', /\d/)



a = 'It costs $12.'
show_regexp(a, /c.s/)
show_regexp(a, /./)
show_regexp(a, /\./)



































