class Song
	def initialize(name, artist, duration)
		@name = name
		@artist = artist
		@duration = duration
	end
end

class Song
	def to_s
		"Song: #@name--#@artist (#@duration)"
	end
end

class Song
	attr_reader :name, :artist, :duration
end

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

require 'test/unit'
class TestSongList < Test::Unit::TestCase
	def test_delete
		list = SongList.new
		s1 = Song.new('title1', 'artist1', 1)
		s2 = Song.new('title2', 'artist2', 2)
		s3 = Song.new('title3', 'artist3', 3)
		s4 = Song.new('title4', 'artist4', 4)
		list.append(s1).append(s2).append(s3).append(s4)
		assert_equal(s1, list[0])
		assert_equal(s3, list[2])
		assert_nil(list[9])
		
		assert_equal(s1, list.delete_first)
		assert_equal(s2, list.delete_first)
		assert_equal(s4, list.delete_last)
		assert_equal(s3, list.delete_last)
		assert_nil(list.delete_last)
	end
end

class SongList
	def with_title(title)
		for i in 0...@songs.length
			return @songs[i] if title == @songs[i].name
		end
		return nil
	end
end

class SongList
	def with_title(title)
		@songs.find {|song| title == song.name}
	end
end


list = SongList.new
s1 = Song.new('title1', 'artist1', 1)
s2 = Song.new('title2', 'artist2', 2)
s3 = Song.new('title3', 'artist3', 3)
s4 = Song.new('title4', 'artist4', 4)
list.append(s1).append(s2).append(s3).append(s4)

puts(list.with_title('title3'))



























