puts "hello world"
puts "Riley".reverse
puts "40".to_s.reverse
print [12, 47, 35].max
ticket = [12, 47, 35]
ticket.sort!
print ticket
poem = "My toast has flown from my hand
And my toast has gone to the moon.
But when I saw it on television,
Planting our flag on Halley's comet,
More still did I want to eat it.
"
poem["toast"] = "honeydew"
print poem
print poem.lines.to_a.reverse
print poem.lines.to_a.reverse.join
print poem.lines.to_a.reverse.to_s
print poem.include?"my hand"
print poem.downcase
poem.delete "o"
print poem
books = {}
books["Gravity's Rainbow"] = :splendid
books["Gravity's Rainbow1"] = :quite_not_good
books["Gravity's Rainbow2"] = :abysmal
books["Gravity's Rainbow3"] = :splendid
books["Gravity's Rainbow4"] = :quite_not_good
books["Gravity's Rainbow5"] = :abysmal
print books.length
print books["Gravity's Rainbow"]
print books.keys
ratings = Hash.new(0)
books.values.each { |rate| ratings[rate]+=1}
5.times {print 'Odelay'}
print Dir.entries "c:/"
print Dir["c:/*.txt"]
print File.read("c:/mongodb.txt")
#FileUtils.cp('/comics.txt', '/Home/comics.txt')
#Dir["/Home/*.txt"]
#File.open("/Home/comics.txt", "a") do |f|
#	f << "Cat and Girl: http://catandgirl.com/"
#end
#print File.read("/Home/comics.txt")
#File.mtime("/Home/comics.txt")
#File.mtime("/Home/comics.txt").hour
#def load_comics(path)
#	comics = {}
#	File.foreach(path) do |line|
#		name, url = line.split(': ')
#		comics[name] = url.strip
#	end
#	comics
#end
#comics = load_comics('/comics.txt')
#{"Achewood"=>"http://achewood.com/", "Dinosaur Comics"=>"http://qwantz.com/", "Perry Bible Fellowship"=>"http://cheston.com/pbf/archive.html", "Get Your War On"=>"http://mnftiu.cc/"}
require "popup"
Popup.goto "http://ruby-lang.org"
Popup.make {
  h1 "My Links"
  link "Go to Ruby", "http://ruby-lang.org/"
}

Popup.make do
  h1 "Things To Do"
  list do
    p "Try out Ruby"
    p "Ride a tiger"
    p "(down River Euphrates)"
  end
end

comics = load_comics( '/comics.txt' )
Popup.make do
  h1 "Comics on the Web"
  list do
    comics.each do |name, url|
      link name, url
    end
  end
end

class BlogEntry
	attr_accessor :title, :time, :fulltext, :mood
end

entry = BlogEntry.new
entry.title = 'Today Mt. Hood was Stolen!'
entry.mood = :sick
entry.fulltext = "I can't believe Mt. Hood was stolen! I am speechless! It was stolen by a giraffe who drove away in his Cadillac Seville very nonchalant!!"
print entry


class BlogEntry
	def initialize(title, mood, fulltext)
		@time = Time.now
		@title, @mood, @fulltext = title, mood, fulltext
	end
end

entry2 = BlogEntry.new("I Left my Hoodie on the Mountain!", :confused, "I am never going back to that mountain and I hope a giraffe steals it.")
blog = [entry, entry2]

blog.sort_by {|entry| entry.time}.reverse

Time.now - 2.weeks