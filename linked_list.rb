require_relative 'node'
class LinkedList
  attr_reader :first_node

  def initialize
    @first_node = nil
  end

  def append(value)
    if @first_node.nil?
      @first_node = Node.new(value)
    else
      tail.next_node = Node.new(value)
    end
  end

  def prepend(value)
    @first_node = Node.new(value, head)
  end

  def size
    count = 0
    node = @first_node
    count += 1 if node
    until node.next_node.nil?
      node = node.next_node
      count += 1
    end
    count
  end

  def head
    @first_node
  end

  def tail
    node = @first_node
    node = node.next_node until node.next_node.nil?
    node
  end

  def at(index)
    count = 0
    if @first_node.nil?
      puts 'List is empty'
      return
    end
    node = @first_node
    until count == index
      if node.next_node.nil?
        puts 'Reached the end of list, there is no such index'
        return
      end
      node = node.next_node
      count += 1
    end
    node
  end

  def pop
    return if head.nil?

    @first_node = nil if head.next_node.nil?
    previous = head
    current = head.next_node

    until current.next_node.nil?
      previous = current
      current = current.next_node
    end

    previous.next_node = nil
    current
  end

  def contains?(value)
    node = @first_node
    return true if node.value == value

    until node.next_node.nil?
      node = node.next_node
      return true if node.value == value
    end
    false
  end

  def find(value)
    index = 0
    node = @first_node
    return nil if node.nil?
    return index if node.value == value

    until node.next_node.nil?
      node = node.next_node
      index += 1
      return index if node.value == value
    end
  end

  def to_s
    string = ''
    node = @first_node
    string += '( ' + node.value + ' )'
    until node.next_node.nil?
      node = node.next_node
      string += ' -> ( ' + node.value + ' )'
    end
    string + ' -> nil'
  end

  def insert_at(value, index)
    if size < index
      append(value)
      puts 'List too small, value inserted at the end of the list'
      return
    end

    if index.zero?
      prepend(value)
      return
    end

    count = 1
    previous = head
    current = head.next_node

    until count == index
      previous = current
      current = current.next_node
      count += 1
    end
    current = Node.new(value, current)
    previous.next_node = current
  end

  def remove_at(index)
    if size < index
      puts "List too small, didn't remove anything"
      return
    end

    if index.zero?
      @first_node = nil
      return
    end

    count = 1
    previous = head
    current = head.next_node

    until count == index
      previous = current
      current = current.next_node
      count += 1
    end
    following = current.next_node
    previous.next_node = following
  end
end
