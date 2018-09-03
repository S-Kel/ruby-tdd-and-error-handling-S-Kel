# This is a simple divider.
# Imagine the user tries to divide by zero
# Ruby will rightfully freak out and crash with a ZeroDivisionError
# Let's bring in some error handling to display a nice message.
#

class String
    def is_i?
       /\A[-+]?\d+\z/ === self
    end
end

def divide (dividend,divisor)
    quotient = dividend/divisor
end

puts "--------------------"
puts "--- Division App ---"
puts "--------------------"
begin
    print "Give me a number: "
    number1 = gets.chomp.to_i
    print "Give me another number: "
    number2 = gets.chomp.to_i
    answer = divide(number1,number2)
    print "#{number1}  ÷  #{number2} = "
    print "#{answer || "error"}"
    puts
rescue  => exception
    puts "- A #{exception.message} error has occurred.\n- Please enter a numerical number to proceed."
    retry
end
#
# Code along challenge: if they hit an error, take them back to "give me a number"