class LinkedList
  def initialize
    @head = nil
    @tail = nil
    @size = 0
  end
  
  # Adds a new node to the end of the list
  def append(node)
    if(size == 0)
      @head = node
      @tail = node
    else
      # Link the two nodes together
      @tail.next = node
      node.prev = @tail
      @tail = node
    end
    @tail.next = nil
    
    @size += 1
  end
  
  # Adds a new node to the start of the list
  def prepend(node)
    if(size == 0)
      @head = node
      @tail = node
      @head.next = nil
    else
      # Link the two nodes together
      @head.prev = node
      node.next = @head
      @head = node
    end
    
    @size += 1
  end
  
  # Returns the total number of nodes in the list
  def size
    return @size
  end
  
  # Returns the first node in the list
  def head
    return @head
  end
  
  # Returns the last node in the list
  def tail
    return @tail
  end
  
  # Returns the node at the given index
  def at(index)
    return nil if(index > @size)
    
    pointer = @head
    
    for i in (0..index)
      return pointer if(i == index)
      
      pointer = pointer.next
    end
  end
  
  # Removes the last element from the list
  def pop
    return if(@size == 0)
    
    pointer = @tail
    pointer.prev.next = nil
    
    @size -= 1
  end
  
  # Returns true if the passed in value is in the list and otherwise returns false.
  def contains?(value)
    pointer = @head
    
    while(pointer != nil)
      return true if(pointer.value == value)
      
      pointer = pointer.next
    end
    
    return false
  end
  
  # Returns the index of the node containing data, or nil if not found.
  def find(data)
    pointer = @head
    index = 0
    
    while(pointer != nil)
      return index if(pointer.value == data)
      
      index += 1
      pointer = pointer.next
    end
    
    return nil if(pointer == nil)
  end
  
  # Display the linked list contents in string format
  def to_s
    pointer = @head
    
    while(pointer != nil)
      print "(#{pointer.value}) -> " 
      pointer = pointer.next
    end
    puts "nil"
  end
end

class Node
  attr_accessor :value, :next, :prev
  
  def initialize
    @value = nil
    @next = nil
    @prev = nil
  end
  
  # Returns the value contained in this node
  def value
    return @value
  end
  
  # Returns a link to the next and prev nodes respectively
  def next_node
    return @next
  end
  
  def prev_node
    return @prev
  end
  
end

ll = LinkedList.new
n = Node.new
n.value = 1
n2 = Node.new
n2.value = 2
n3 = Node.new
n3.value = 3
n4 = Node.new
n4.value = 4

# 4 -> 1 -> 2 -> 3
ll.append(n)
ll.append(n2)
ll.append(n3)
ll.prepend(n4)
1.times do
  ll.pop
end

ll.to_s
pointer = ll.head
#while(pointer != nil)
#  print "#{pointer.value} -> "
#  pointer = pointer.next
#end
puts "END"
puts "SIZE: #{ll.size}"
puts "FIND 5: #{ll.find(5)}"
puts "FIND 2: #{ll.find(2)}"
puts "AT 1: #{ll.at(1).value}"
puts "AT 3: #{ll.at(3)}"
puts "Contains? 2: #{ll.contains?(2)}"
puts "Contains? 5: #{ll.contains?(5)}"

=begin
n = Node.new
n.value = 1
n2 = Node.new
n2.value = 2
n3 = Node.new
n3.value = 3
n.next = n2
n.prev = nil
@head = n
@head.prev = n3
n3.next = @head
@head = n3
puts "#{@head.value} -> #{@head.next.value} -> #{@head.next.next.value}"
puts "#{n.prev.value}"
=end