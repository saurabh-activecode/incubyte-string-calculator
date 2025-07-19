require_relative 'string_calculator'
require 'stringio'

#read filename as the first argument passed
file_name = ARGV[0]

# read the file as an array of lines
# join the array to form a string
numbers = IO.readlines(file_name).join

# pass the 'numbers' string to the add method
# print the sum to the console
puts StringCalculator.add(numbers)