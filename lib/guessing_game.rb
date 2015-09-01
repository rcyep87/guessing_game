require 'securerandom'  # => true

class GuessingGame
  attr_accessor :comp_num   # => nil
  attr_accessor :guess_num  # => nil

  def initialize
    @comp_num = 0  # => 0
  end

  def comp_num(guess_num)
    @comp_num = SecureRandom.random_number(100)                                                    # => 44
    if guess_num == @comp_num                                                                      # => false
      puts "Congrats, you've won! GuessNum: #{guess_num}, CompNum: #{@comp_num}"
    elsif guess_num < @comp_num                                                                    # => false
      puts "You've guessed low! Please try again. GuessNum: #{guess_num}, CompNum: #{@comp_num}"
    elsif guess_num > @comp_num                                                                    # => true
      puts "You've guessed high! Please try again. GuessNum: #{guess_num}, CompNum: #{@comp_num}"  # => nil
    else
      puts "What are you doing?!"
    end                                                                                            # => nil
  end

end

guess_num = GuessingGame.new  # => #<GuessingGame:0x007fe561868af0 @comp_num=0>

print "Please guess a number between 1 and 100: > "
ask_user = gets.chomp.to_i
guess_num.comp_num(ask_user)        # => nil

# >> You've guessed high! Please try again. GuessNum: 50, CompNum: 44
