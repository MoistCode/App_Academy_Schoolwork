require 'byebug'

class AttrAccessorObject
  def self.my_attr_accessor(*names)

    # Names gives us an array, in this case, they are the symbols :x, :y
    # We can iterate through and define a method for each
    # These methods being getters and setters
    # Why is name AttrAccessorObject?
    # How do we define these methods within the class that it was called
    # on and not on the AttrAccessorObject class itself.

    names.each do |name|
      define_method(name.to_s) do
        eval("@#{name.to_s}")
      end

      define_method(name.to_s.concat('=')) do |new_val|
        p name.to_s, new_val.to_s
        eval("@#{name.to_s} = #{new_val}")
      end

    end

  end
end

# class Human
#   my_attr_accessor :name, :age, :coolness
#   # When using AttrAccessorObject.my_attr_accessor, using name returns
#   # "Human". This is because we're passing through the class
#   # name is also AttrAccessorObject?
#
#   def initialize(name, age, coolness)
#     @name = name
#     @age = age
#     @coolness = coolness
#   end
# end

# Setter
# def some_method
#   @some_instance_variable
# end
#
# Getter
# def some_method(new_value)
#   @some_instance_variable = new_value
# end
