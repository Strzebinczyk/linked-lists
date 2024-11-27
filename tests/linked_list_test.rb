require_relative '../linked_list'
require 'test/unit'

class LinkedListTest < Test::Unit::TestCase
  def test_append
    list = LinkedList.new
    node = list.append('mama')
    expected = Node
    assert_equal(expected, node.class)
  end

  def test_prepend
    list = LinkedList.new
    list.append('mama')
    list.prepend('tata')
    expected = 'tata'
    assert_equal(expected, list.first_node.value)
    expected = 'mama'
    assert_equal(expected, list.first_node.next_node.value)
  end

  def test_size
    list = LinkedList.new
    list.append('mama')
    list.prepend('tata')
    expected = 2
    assert_equal(expected, list.size)
    list.append('Franek')
    list.append('Lutek')
    expected = 4
    assert_equal(expected, list.size)
  end

  def test_head
    list = LinkedList.new
    list.append('mama')
    list.append('Franek')
    list.append('Lutek')
    expected = 'mama'
    assert_equal(expected, list.head.value)
    list.prepend('tata')
    expected = 'tata'
    assert_equal(expected, list.head.value)
  end

  def test_tail
    list = LinkedList.new
    list.append('mama')
    expected = 'mama'
    assert_equal(expected, list.tail.value)
    list.append('Vala')
    expected = 'Vala'
    assert_equal(expected, list.tail.value)
  end

  def test_at
    list = LinkedList.new
    expected = nil
    assert_equal(expected, list.at(0))
    list.append('mama')
    list.append('Franek')
    list.append('Lutek')
    list.append('dog')
    list.append('cat')
    list.append('parrot')
    expected = 'dog'
    assert_equal(expected, list.at(3).value)
  end

  def test_contains?
    list = LinkedList.new
    list.append('mama')
    list.append('Franek')
    list.append('Lutek')
    list.append('dog')
    list.append('cat')
    list.append('parrot')
    expected = true
    assert_equal(expected, list.contains?('cat'))
    expected = false
    assert_equal(expected, list.contains?('tata'))
  end

  def test_find
    list = LinkedList.new
    expected = nil
    assert_equal(expected, list.find('cat'))
    list.append('mama')
    list.append('Franek')
    list.append('Lutek')
    list.append('dog')
    list.append('cat')
    list.append('parrot')
    expected = 4
    assert_equal(expected, list.find('cat'))
    expected = nil
    assert_equal(expected, list.find('cart'))
  end

  def test_pop
    list = LinkedList.new
    list.append('mama')
    list.append('Franek')
    list.append('Lutek')
    list.append('dog')
    list.append('cat')
    list.append('parrot')
    expected = 'parrot'
    assert_equal(expected, list.pop.value)
    expected = 'cat'
    assert_equal(expected, list.tail.value)
  end

  def test_to_s
    list = LinkedList.new
    list.append('dog')
    list.append('cat')
    list.append('parrot')
    list.append('hamster')
    list.append('snake')
    list.append('turtle')
    expected = '( dog ) -> ( cat ) -> ( parrot ) -> ( hamster ) -> ( snake ) -> ( turtle ) -> nil'
    assert_equal(expected, list.to_s)
  end
end
