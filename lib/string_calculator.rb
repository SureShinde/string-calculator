# frozen_string_literal: true

# Main Class String Calculator
class StringCalculator
  def self.add(input)
    return 0 if input.empty?

    # Get Delimiter or set default (comma , & newline \n)
    delimiter = input.start_with?('//') ? input[2..].split("\n")[0] : ",|\n"

    # Parse Numbers by delimiter
    numbers = input.split(/#{delimiter}/).map(&:to_i)

    # Find negative numbers
    negatives = numbers.select(&:negative?)

    # Throw exception for negative numbers
    raise "negative numbers not allowed: #{negatives.join(', ')}" if negatives.any?

    numbers.sum
  end
end
