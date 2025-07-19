class StringCalculator
  DEFAULT_DELIMITERS = /,|\n/

  def self.add(numbers)
    return 0 if numbers.strip.empty?

    delimiters = DEFAULT_DELIMITERS

    num_list = numbers.split(delimiters).map(&:to_i)

    negatives = num_list.select { |n| n < 0 }
    unless negatives.empty?
      raise "negative numbers not allowed: #{negatives.join(',')}"
    end

    num_list.sum
  end
end
