def spell_out_numbers(num)
	str_array = num.to_s.split("")		#convert num to an reversed int array
	int_array = to_intArray(str_array)	#of each place's number.
	r = int_array.reverse
	places(r)
end

def to_intArray(a)				#convert string array to int array 
	b = Array.new(a.length)
	for i in 0..a.length-1
		b[i] = a[i].to_i
	end
	b
end

def places(a)					# check the number of digit  
	if (1..3).include?(a.length)		#by a.length and pass to 
			up_to999(a[0..2])	#adequate method depending
	elsif (4..6).include?(a.length)		#on it.
			thousands_place(a)
	elsif (7..9).include?(a.length)
			millions_place(a)
	else
			"check the number"
	end
end

def ones_place(op)				#spell out numbers in one's place
	case op					#op -> a number in one's place
		when 0
			""
		when 1
			"one"
		when 2
			"two"
		when 3
			"three"
		when 4
			"four"
		when 5
			"five"
		when 6
			"six"
		when 7
			"seven"
		when 8
			"eight"
		when 9
			"nine"
		else
			"check the number"
	end
end

def up_to99(tep,op)				#spell out number between 1 and 99
	if tep == 1				#return "" if   
		result1 = case op		#tep == nil && tep == 0 
			when 0								
				"ten"		#tep -> a number in ten's place
			when 1			#op -> a number in one's place
				"eleven"
			when 2
				"twelve"
			when 3
				"thirteen"
			when 4
				"fourteen"
			when 5
				"fifteen"
			when 6
				"sixteen"
			when 7
				"seventeen"
			when 8
				"eighteen"
			when 9
				"nineteen"
		end
			"#{result1}"
	else
		result2 = case tep
			when 0 || nil
				""
			when 2
				"twenty"
			when 3
				"thirty"
			when 4
				"fourty"
			when 5
				"fifty"
			when 6
				"sixty"
			when 7
				"seventy"
			when 8
				"eighty"
			when 9
				"ninety"
		end
		if op == 0
			"#{result2}"
		elsif tep == 0
			"#{ones_place(op)}"
		else
			"#{result2}-#{ones_place(op)}"
		end
	end
end

def hundreds_place(hp)				#spell out number in hundred's place
	if hp == 0				#return ""
		""				#if hp == 0
	else										
		"#{ones_place(hp)} hundred "	#hp -> a number in hundred's place
	end
end

def up_to999(a)					#spell out number between 0 and 999
	if a.length == 1 && a[0] == 0
		"zero"
	else
		case a.length
			when 1
				ones_place(a[0])
			when 2
				up_to99(a[1],a[0])
			when 3	
				hundreds_place(a[2]) + up_to99(a[1],a[0])
			else
				"check the number"
		end
	end
end

def thousands_place(a)				#spell out number between 1000 and 999999
	first = up_to999(a[0..2])
	second = up_to999(a[3..5])
	str1 = "#{second} thousands #{first}"
end						#first -> three numbers from one's place to hundreds place
						#second -> three numbers from thousand's place
												
def millions_place(a)				#spell out number between 1000000 and 999999999
	first = up_to999(a[0..2])
	second = up_to999(a[3..5])			
	third = up_to999(a[6..8])		#third -> three numbers from  million's place
	str1 = "#{third} million #{second} thousands #{first}"
end