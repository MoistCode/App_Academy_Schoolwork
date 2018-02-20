# PHASE 2
class ArgumentError

  def message
    puts "Can not convert this to int"
  end
end

def convert_to_int(str)
  begin
    Integer(str)
  rescue ArgumentError => e
    puts e.message
    nil
  end
end

# PHASE 3
FRUITS = ["apple", "banana", "orange"]

def reaction(maybe_fruit)
  if FRUITS.include? maybe_fruit
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  else
    raise StandardError
  end
end

def feed_me_a_fruit
  puts "Hello, I am a friendly monster. :)"

  begin
    puts "Feed me a fruit! (Enter the name of a fruit:)"
    maybe_fruit = gets.chomp
    reaction(maybe_fruit)
  rescue StandardError
    retry if maybe_fruit == 'coffee'
  end
end

# PHASE 4
class BestFriendError < ArgumentError
  def message
    puts "Can not be best friend"
  end
end
class NoNameError < ArgumentError
  def message
    puts "My best friend needs to have a name"
  end
end
class NoPastError < ArgumentError
  def message
    puts "My best friend needs to have past time"
  end
end
class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    begin
      raise NoNameError if name.empty?
      raise NoPastError if fav_pastime.empty?
      @name = name
      @fav_pastime = fav_pastime
    rescue NoNameError => e
      e.message
      name = gets.chomp
      retry
    rescue NoPastError => e
      e.message
      fav_pastime = gets.chomp
      retry
    end
    begin
      if yrs_known < 5
        puts "Please enter an integer > 5"
        yrs_known = convert_to_int(gets.chomp)
        raise BestFriendError
      elsif yrs_known.is_a?(Integer)
        @yrs_known = yrs_known

      else
        puts "Please enter an integer"
        yrs_known = convert_to_int(gets.chomp)
        raise TypeError
      end
    rescue TypeError
      retry
    rescue BestFriendError => e
      e.message
      retry
    end

  end

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me."
  end
end
