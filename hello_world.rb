p "Hellow World"
p 42
p [1, 2, 3]

some_adj = "extremely cruel"

#can use either as "console.log"
p some_adj
puts some_adj

# string interpolation is available with double quotes
p "Hello #{some_adj} World"



#METHODS

# ruby has a TON of awesome built in methods
# here are some string methods for example:

# note you can often omit parentheses
p some_adj.reverse
p some_adj.upcase
p some_adj.succ

# you can chain
p some_adj.reverse.upcase

#there are tons of methods for arrays also
adjectives = ['cruel', 'happy', 'blue', 'scary']

#combining it all
p "Hello #{adjectives.sample} World"

# In ruby there are only methods b/c it is OO
# METHODS IN RUBY ARE DEFINED with a keyword 'def' and must end with keyword 'end'
def say_hello
	p "Hello! Or whatever"
end

#calling a method
say_hello

# the last line of a ruby method is its return value
# you do not need to include 'return'
def say_hello_implicit_return
	"this string was returned because it was the last line in the method"
end

p say_hello_implicit_return

# for 'checking' methods you can end them with a ?
# 'something' is your parameter. parentheses around the parameter is optional
def is_palindrome? input
	input == input.reverse
end

p is_palindrome? "radar"
p is_palindrome?("reuben")

# PRACTICE
# write a method length_five? that takes a string, returns true if it has exactly 5 characters
# and returns false otherwise
def length_five? string
	string.length === 5
end

p length_five? "alyssa"
p length_five? "pizza"



# METHODS - 2 or more parameters

# method to return area
def get_area length, width
	length * width
end

p get_area 5, 4
p "^^ should be 20"

# PRACTICE
# write a ruby method that takes 2 strs and returns interpolated string 
# with the word "and" between the 2 strs

def two_strings str1, str2
	"#{str1} and #{str2}"
end

p two_strings "hello", "goodbye"


# write a method that takes a number of mins and returns decimal hours
# e.g. 90 ---> 1.5, 75 ---> 1.25 etc.
def mins_to_decimal num_mins
	num_mins.to_f / 60
end

p mins_to_decimal 90

# change integer to float with .to_f
# change integer to string with .to_s
# change string to integer with .to_i

# write a method that chooses element at index "index" and 
# returns it or returns "out of range" if there's no element

def pick_element arr, index
	arr[index] || "Out of range"
end

p pick_element [1, 2, 3, 4, 5], 65
p pick_element [1, 2, 3, 4, 5], 3
p pick_element [1, 2, 3, 4, 5], -2 #you can count from the end of the array with negative indices

# also note: logical operators are basically the same as JS
# also note: null in JS is nil in ruby. it functions the same way


#CANT DO THIS! 
# my_name = "alyssa"

# def greet 
# 	my_name #YOU CANT GET THAT IN HERE IT ONLY EXISTS OUT THERE
# end

# p greet # <--- this will not work


# THESE WORKS! examples of scoping that is valid in ruby
my_name = "alyssa"

def greet some_str
	some_str
end

p greet my_name


number = 64

def get_root num
	Math.sqrt num
end


def get_exp_five num
	num ** 5
end

p get_root number
p get_exp_five number


# methods can (and often do) call each other

#convert to uppercase and reverse
def mutate words
	words.upcase.reverse
end

#call mutate, interpolating input into the beginning of a string
def weirdify_words input
	mutate "#{input} The republic of Georgia"
end

p weirdify_words "you really outta go to"


# HASHES in ruby are like objects in JS but with no methods 
# and also no dot notation access to properties

book = {
	:title => "The Great Gatsby",
	:author => "F Scott Fitz",
	:year => 1925
}

# you can use shorthand like below to create the object above
book = {
	title: "The Great Gatsby",
	author: "F Scott Fitz",
	year: 1925
}

puts "here comes a book"
p book

# when you are passing an anonymous hash into a method, you _do_ need
# parentheses so that it isn't confused for a block

guy = {name: "Jim", age: "65"}

# p guy.name #cant do this because ruby will think you are trying to call a method
p guy[:name]
p book[:title]

# return randomized list of the keys
def shuffle_keys some_hash
	some_hash.keys.shuffle
end

# you can omit {} if an anonymous hash is the last parameter passed to a method
p shuffle_keys name: "Jim", age: 30

# if there are two arguments, it's still fine
def return_args num, hash
	[num, hash]
end

p return_args 100, name: "Jim", age: 30