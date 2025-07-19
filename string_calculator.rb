class StringCalculator
  DEFAULT_DELIMITERS = /,|\n/

  def self.add(numbers)
    return 0 if numbers.strip.empty?

    delimiters = DEFAULT_DELIMITERS

    if numbers.start_with?("//")
      # split the string into delimiter and number string
      custom_delimiter_string, numbers = extract_custom_delimiter(numbers)
      # create a regex from the delimiter string
      custom_delimiter = Regexp.new(Regexp.escape(custom_delimiter_string))
      # merge the 2 regex to support default and custom delimiters
      delimiters = Regexp.union(delimiters, custom_delimiter)
    end

    # split the string via the delimiters
    num_list = numbers.split(delimiters).map(&:to_i)

    # map the array and find negatives
    # handle errors
    negatives = num_list.select { |n| n < 0 }
    unless negatives.empty?
      raise "negative numbers not allowed: #{negatives.join(',')}"
    end

    # return sum of the numbers array
    num_list.sum
  end

  def self.extract_custom_delimiter(input)
    # splits the string in two via the first newline
    delimiter_number_split = input.split("\n", 2)
    # select numbers string as the sconds part of the split input string
    numbers = delimiter_number_split.last
    # select the sub-string from the first part of split input string
    # from index 2 till last
    delimiter = delimiter_number_split.first[2..-1]


    return delimiter, numbers
  end
end
