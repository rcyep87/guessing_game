require 'securerandom'  # => true
require 'pry'
class GuessingGame
  attr_accessor :comp_num   # => nil

  def initialize
    @comp_num = 0  # => 0
    @guess_num_array = []
  end

  def comp_num(guess_num)
    @comp_num = SecureRandom.random_number(100)
    if check_dup(guess_num)
      puts "No repeats! Please try again."
    else
      if guess_num < @comp_num                                                                             # => false
        puts "You've guessed low! Please try again. GuessNum: #{guess_num}, CompNum: #{@comp_num}"
      elsif guess_num > @comp_num                                                                          # => false
        puts "You've guessed high! Please try again. GuessNum: #{guess_num}, CompNum: #{@comp_num}"
      elsif guess_num == @comp_num                                                                          # => true
        puts "Congrats, you've won! GuessNum: #{guess_num}, CompNum: #{@comp_num}"                   # => nil
        exit                                                                                     # ~> NameError: uninitialized constant GuessingGame::Exit
      end
      @guess_num_array << guess_num
    end
  end

  def check_dup(guess_num)
    @guess_num_array.include?(guess_num)
  end
end

class Player

  def initialize

  end

  def prompt
    x = 0
    guess_num = GuessingGame.new  # => #<GuessingGame:0x007fe33a102f00 @comp_num=0>
    while x < 5
      print "Please guess a number between 1 and 100: > "  # => nil
      ask_user = gets.chomp.to_i                           # ~> NoMethodError: undefined method `chomp' for nil:NilClass
      guess_num.comp_num(ask_user)
      x += 1
    end
    puts "You've lost. You suck at lyfe"
  end
end

player = Player.new
player.prompt

