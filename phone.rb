#
# Write a program that cleans up user-entered phone numbers so that they can be sent SMS messages.
#
# The rules are as follows:
#
# If the phone number is less than 10 digits assume that it is bad number
# If the phone number is 10 digits assume that it is good
# If the phone number is 11 digits and the first number is 1, trim the 1 and use the last 10 digits
# If the phone number is 11 digits and the first number is not 1, then it is a bad number
# If the phone number is more than 11 digits assume that it is a bad number
# We've provided tests, now make them pass.


class Phone
  # constants used to store a value for the duration of a Ruby program's execution
  LENGTH = 10
  BAD_NUMBER = "0000000000"

  attr_reader :number

  def initialize(input)
    @number = extract_number(input)
  end

  def area_code
    #  " a ||= b if a is false, nil or undefined, then evaluate b and set a to the result"
    @area_code ||= number.slice(0, 3)
  end
      

  def to_s
    "(#{area_code}) #{exchange}-#{suffix}"
  end

  def extract_number(input)
           # \D Matches any non-digit character
           #  + Matches the preceding expression 1 or more times
    input = input.gsub(/\D+/, '')

    if input.length == LENGTH
      input
    elsif input.length == LENGTH + 1 && valid_country_code?(input)
      remove_country_code(input)
    else
      BAD_NUMBER
    end
  end

  def valid_country_code?(input)
    input.start_with?('1')
  end

  def remove_country_code(input)
    input.slice(1..-1)
  end

  def exchange
    @exchange ||= number.slice(3, 3)
  end

  def suffix
    @suffix ||= number.slice(6, 4)
  end


end
