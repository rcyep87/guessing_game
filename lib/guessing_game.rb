require 'securerandom'  # => true

class GuessingGame
  def initialize
    @comp_num       # => nil
    @guess_num      # => nil
  end

  def comp_num(guess_num)
    @comp_num = SecureRandom.random_number(100)  # => 80
    if @guess_num == @comp_num                   # => false
      puts "Congrats, you've won!"
    else
      puts "Please try again!"                   # => nil
    end                                          # => nil
  end
end

# random_num = Random.new        # => #<Random:0x007f9a7b853910>
# puts random_num.rand(0...100)  # => nil


guess_num = GuessingGame.new  # => #<GuessingGame:0x007fb9f310c200>
guess_num.comp_num(10)        # => nil

# >> Please try again!
