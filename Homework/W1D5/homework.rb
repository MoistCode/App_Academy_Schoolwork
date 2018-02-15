class Stack

  attr_reader :name, :age
  attr_accessor :items, :status

  def initialize(hsh)
    @name = hsh[:name]
    @age = hsh[:age]
    @status = hsh[:status]
    @items = hsh[:item]
  end

  def run
    self.show
    self.add("Book")
    self.show
    self.remove
    self.show
  end

  def add(el)
    @items << el
  end

  def remove
    @items.pop
  end

  def show
    puts "#{@name} (age: #{@age}) is currently #{@status} and has "
    puts "He/she has on them a"
    @items.each {|el| print "#{el} "}
    puts "\n"
  end

end

class Queue

  attr_reader :arr

  def initialize(arr = [])
    @arr = arr
  end

  def run
    self.show
    self.enqueue("Cow")
    self.show
    self.dequeue
    self.show
  end

  def enqueue(el)
    @arr.push(el)
  end

  def dequeue
    @arr.pop
  end

  def show
    puts "Current Queue: ##{arr}"
  end

end

class Map

  attr_reader :storage
  attr_accessor :arr

  def initialize(storage = {})
    @storage = storage
    @arr = Array.new
  end

  def run
    self.storage
    self.show
    self.hsh_to_a
    self.show
    self.assign(:t, "new")
    self.show
    self.lookup(:t)
    self.remove(:a)
    self.show
  end

  def show
    puts "Current map: #{@arr}"
  end

  def hsh_to_a
    @storage.each do |k, v|
      @arr << [k, v]
    end
  end

  def assign(key, value)
    bool = false
    idx = nil

    @arr.each_with_index do |el, idx|
      if el.first == key
        bool = true
        idx = idx
        break
      end
    end

    if bool
      @arr[idx] << value
    else
      @arr << [key, value]
    end
  end

  def lookup(key)
    @arr.each do |el|
      if el.first == key
        puts "Value(s) at #{key}: #{el.drop(1)}"
      else
        "Not here"
      end
    end
  end

  def remove(key)
    @arr.each_with_index do |el, idx|
      if el.first == key
        @arr.delete_at(idx)
      end
    end
  end

end

if __FILE__ == $PROGRAM_NAME
  stack1 = Stack.new({name: "Tommy", age: 26, status: "Studying",
                      item: ["Laptop", "Phone"]}).run

  stack2 = Stack.new({name: "Timmy", age: 30, status: "Skiing",
                      item: ["Protein Shake", "Pencil"]}).run

  list1 = Queue.new([:a, :b, :c, :d]).run

  map1 = Map.new({a: "cow", b: "monkey", c: "doge"}).run
end
