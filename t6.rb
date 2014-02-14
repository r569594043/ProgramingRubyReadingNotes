for i in 1..100
	print "Now at #{1}. Restart? "
	retry if gets =~ /^y/i
end