# frozen_string_literal: true

class StringCalculator
  def self.add(numbers)
    delimiter = numbers.start_with?('//') ? numbers[2..-1].split("\n")[0] : ",|\n"
    numbers = numbers.split(/#{delimiter}/).map(&:to_i)

    negative_numbers = numbers.select { |n| n < 0 }

    raise "negative numbers not allowed: #{negative_numbers.join(', ')}" if negative_numbers.any?

    numbers.sum
  end
end
