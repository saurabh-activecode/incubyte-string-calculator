# String Calculator
Incubyte TDD Assessment "String Calculator"

Assignment instructions: https://blog.incubyte.co/blog/tdd-assessment/

This code was build using:

```

ruby 3.4.5 (2025-07-16 revision 20cda200d3) +PRISM [x86_64-darwin21]

RSpec 3.13
  - rspec-core 3.13.5
  - rspec-expectations 3.13.5
  - rspec-mocks 3.13.5
  - rspec-support 3.13.4

```

## Running the RSpecs

```
rspec string_calculator_spec.rb 
.....................

Finished in 0.01207 seconds (files took 0.14965 seconds to load)
21 examples, 0 failures

```

## Running the examples

The examples folder contains text files with various scenarios to validate the functioning of the code e.g.

```
cat examples/numbers_with_newline.txt 
1
2
3
4
5%
```


The method "StringCalculator.add" is accessed via the 'calculate.rb'.

'calculate.rb' accepts the relative path of the example text files as a console argument and prints the response back to the console.

### Numbers with commas
```
cat examples/numbers_with_comma.txt 
1,2,3,4,5%                                 

ruby calculate.rb examples/numbers_with_comma.txt

15
```

### Numbers with negatives
```
cat examples/multiple_negative_numbers.txt

1,2,3,-1,-2,-3%

ruby calculate.rb examples/multiple_negative_numbers.txt 

/string_calculator.rb:25:in 'StringCalculator.add': negative numbers not allowed: -1,-2,-3 (RuntimeError)
	from calculate.rb:13:in '<main>'
```

### Custom delimited numbers
```
cat examples/custom_delimited_numbers.txt

//;
1;2;3;4;5%

ruby calculate.rb examples/custom_delimited_numbers.txt 
15

```
