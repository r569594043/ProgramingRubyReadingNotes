﻿print "(t)imes or (p)lus:"
times = gets
print "number: "
number = Integer(gets)
if times =~ /^t/
	puts ((1..10).collect {|n| n*number }.join(", "))
else
	puts ((1..10).collect {|n| n+number }.join(", "))
end