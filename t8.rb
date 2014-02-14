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