require 'securerandom'     # => true
require 'pry'              # => true

class GuessingGame
  attr_accessor :comp_num  # => nil

  def initialize
    @comp_num = SecureRandom.random_number(100)  # => 45
    @guess_num_array = []                        # => []
  end

  def comp_num(guess_num)
    if check_dup(guess_num)
      puts "No repeats! Please try again."
    else
      if guess_num < @comp_num
        puts "You've guessed low! Please try again."
      elsif guess_num > @comp_num
        puts "You've guessed high! Please try again."
      elsif guess_num == @comp_num
        puts "Congrats, you've won!"
        exit
      end
      @guess_num_array << guess_num
    end
  end

  def check_dup(guess_num)
    @guess_num_array.include?(guess_num)
  end

  def comp_num_value
    @comp_num
  end

end

class Player

  def initialize

  end

  def prompt
    x = 0                                                                                                  # => 0
    guess_num = GuessingGame.new                                                                           # => #<GuessingGame:0x007fb1b1912ed0 @comp_num=45, @guess_num_array=[]>
    while x < 5                                                                                            # => true
      print "Please guess a number between 1 and 100: > "                                                  # => nil
      ask_user = gets.chomp.to_i                                                                           # ~> NoMethodError: undefined method `chomp' for nil:NilClass
      guess_num.comp_num(ask_user)
      x += 1
    end
    puts "You've lost. You suck at lyfe. The number you were suppose to guess was #{guess_num.comp_num_value}!"
  end
end

player = Player.new  # => #<Player:0x007fb1b1913128>
player.prompt

# >> Please guess a number between 1 and 100: >

# ~> NoMethodError
# ~> undefined method `chomp' for nil:NilClass
# ~>
# ~> /Users/ryep/theironyard/week2/day2/guessing_game/lib/guessing_game.rb:43:in `prompt'
# ~> /Users/ryep/theironyard/week2/day2/guessing_game/lib/guessing_game.rb:52:in `<main>'
