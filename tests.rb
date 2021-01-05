require_relative 'my_each'

def test_my_each
  test_number = 0
  until test_number == 1000
    array_length = Random.rand(20)
    arr = Array.new
    until array_length == 0
      arr = arr + [Random.rand(101)]
      array_length -= 1
    end

    unless arr.my_each {|item| item + item} == arr.each {|item| item + item}
      raise "ERROR! " + arr.my_each {|item| item + item} + " not equal to " + arr.each {|item| item + item}
    end

    if arr.my_each {|item| item + item} == arr.each {|item| item + item}
      p 'success!'
    end
    
    test_number += 1
  end
end

test_my_each
