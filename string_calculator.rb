class StringCalculator
  DEFAULT_DELIMITERS = /,|\n/

  def self.add(numbers)
    return 0 if numbers.strip.empty?

    delimiters = DEFAULT_DELIMITERS

    num_list = numbers.split(delimiters).map(&:to_i)

    num_list.sum
  end
end
