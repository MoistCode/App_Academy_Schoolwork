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
      # The instance varibales returns the value of the given instance
      # varibale or nil if it is not set.
      # The @ part of the variable should be included
      
      define_method(name.to_s) do
        instance_variable_get("@#{name}")
      end

      define_method(name.to_s.concat('=')) do |new_val|
        instance_variable_set("@#{name}", new_val)
      end

    end

  end
end

=begin

class AttrAccessorObject
  def self.my_attr_accessor(*names)
    names.each do |name|

      define_method(name) do
        instance_variable_get("@#{name}")
      end

      define_method("#{name}=") do |value|
        instance_variable_set("@#{name}", value)
      end

    end
  end
end

class Human
  my_attr_accessor :name, :age, :coolness
  # When using AttrAccessorObject.my_attr_accessor, using name returns
  # "Human". This is because we're passing through the class
  # name is also AttrAccessorObject?

  def initialize(name, age, coolness)
    @name = name
    @age = age
    @coolness = coolness
  end
end

Setter
def some_method
  @some_instance_variable
end

Getter
def some_method(new_value)
  @some_instance_variable = new_value
end

=end
