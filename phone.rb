

class Phone
  # constants used to store a value for the duration of a Ruby program's execution
  LENGTH = 10
  BAD_NUMBER = "0000000000"

  attr_reader :number

  def initialize(input)
    @number = extract_number(input)
  end

  def area_code
    # @area_code = area_code || number.slice(0, 3)
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
