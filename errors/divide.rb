# This is a simple divider.
# Imagine the user tries to divide by zero
# Ruby will rightfully freak out and crash with a ZeroDivisionError
# Let's bring in some error handling to display a nice message.
#
require '~/Projects/ruby/wcolorize'

class String
    def is_i?
       /\A[-+]?\d+\z/ === self
    end
end

class NonNumericArgumentError < StandardError
end

def is_number?(num)
    num.is_i? ? true : false
end

def counter_is_zero?(counts)
    return counts == 0 ? true : false
end
def print_message(counts)
    puts ":> You have #{colorize(" #{counts} ", $font_colors[:yellow], $bg_colors[:red])} attempts remaining..."
end

def divide (dividend,divisor)
    quotient = dividend/divisor
end

puts "--------------------"
puts "--- Division App ---"
puts "--------------------"
count = 3
begin
    print ":> Give me a number: "
    number1 = gets.chomp
    raise NonNumericArgumentError, "\n:> #{colorize("'#{number1.upcase}'", $font_colors[:yellow], $bg_colors[:red])} is not a number!" if !is_number?(number1) 
    number1 = number1.to_i

    print ":> Give me another number: "
    number2 = gets.chomp
    raise NonNumericArgumentError, "\n:> #{colorize("'#{number2.upcase}'", $font_colors[:yellow], $bg_colors[:red])} is not a number!" if !is_number?(number2)
    number2 = number2.to_i

    answer = divide(number1,number2)
    print ":> #{number1}  ÷  #{number2} = "
    print ":> #{answer || "error"}"
    puts
rescue NonNumericArgumentError => e
    system "clear"
    puts "#{e.message}"
    if counter_is_zero?(count)
        puts ":> Your attempts are up goodbye!"
        return
    end
    print_message(count)
    count -= 1     
    retry
rescue => exception
    system "clear"
    puts "- A #{exception.message} error has occurred.\n- Please enter a number to proceed."       
    if counter_is_zero?(count)
        puts ":> Your attempts are up goodbye!"
        return
    end
    print_message(count)
    count -= 1 
    retry
end
#
# Code along challenge: if they hit an error, take them back to "give me a number"

# Modify the code in errors/divide.rb to better handle errors:

    #1. Print a more useful message to the user when divide by 0 occurs.
    #2. Give the user 3 chances to provide valid input when they try to divide by 0.
    #3. Create a method to validate that a number is always entered by the user. When a non-number is entered, use     a custom error called NonNumericArgumentError to alert the user that this type of error occurred. (Hint:       You can use the String is_i? method provided in the divide.rb file to complete this step).

    #5. Now ask your partner to give you one of their previous challenge files, and add some error handling to it.     Remember that when you refactor 'legacy code', you should do something small to leave it better than when      you found it - the campsite rule!

    # if counts == 0
    #     system "clear"
    #     puts "Your attempts are up goodbye!"
    #     return true
    # end
    # return false