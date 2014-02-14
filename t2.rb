class Fixnum
	alias old_plus + # we can reference the original '+' as 'old_plus'

	# Redefine addition of Fixnums. This
	# is a BAD IDEA
	def +(other)
		old_plus(other).succ
	end
end

puts 1 + 2
a = 3
puts a += 4
puts a + a + a