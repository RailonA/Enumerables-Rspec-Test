module Enumerable

  def my_all
      raise 'NO BLOCK GIVEN!' unless block_given?
      arr = to_a
      arr.my_each_with_index do |_item, index|
      return false unless yield arr[index]
      end
      true
  end

  def my_any
    raise 'NO BLOCK GIVEN!' unless block_given?

    arr = to_a
    index = 0
    any = false

    arr.my_each do |_item|
      any = true if yield arr[index]

      index += 1
    end

    any
  end

  def my_count(arg = nil)
    arr = to_a

    return arr.length if arg.nil?

    index = 0
    count = 0

    arr.my_each do |_item|
      count += 1 if arg == arr[index]
      index += 1
    end

    count
  end

  def my_each
    arr = to_a
    i =0
    while i < arr.length
        yield arr[i]
        i +=1
    end

    return arr
  end

  def my_each_with_index
    arr = to_a
    i =0
    while i < arr.length
        yield arr[i], i
        i +=1
    end

    return arr
  end

  def my_inject
    raise 'ERROR' unless block_given?

    arr = to_a
    i = 1
    result = arr[0]
    result = '' if result.class == String

    while i < arr.length
      result = yield result, arr[i]
      i += 1
    end

    result
  end

  def my_map(pr=nil)
    raise 'NO BLOCK GIVEN!' unless block_given?
    arr = to_a
    if pr
      arr.my_each_with_index do |_item, index|
          arr[index] = proc.cal arr[index]
      end
    else
      arr.my_each_with_index do |_item, index|
          arr[index] = yield arr[index]
      end
    end
  end

  def my_none
    raise 'NO BLOCK GIVEN!' unless block_given?
    arr = to_a
    arr.my_each_with_index do |_item, index|
    return false if yield arr[index]
    end
    true
  end

  def my_select
    raise 'NO BLOCK GIVEN!' unless block_given?

    arr = to_a
    index = 0

    arr.my_each do |_item|
      arr.delete_at(index) unless yield arr[index]
      index += 1
    end

    arr
  end

  #END
end

def multiply_els
  test_number = 0
  until test_number == 1000

    array_length = Random.rand(20)
    arr = []
    until array_length.zero?
      arr += [Random.rand(101)]
      array_length -= 1
    end

    unless arr.my_inject { |total, n| total * n } == arr.inject { |total, n| total * n }
      p arr.my_inject { |total, n| total * n }
      p arr.inject { |total, n| total * n }
      raise 'MY_INJECT FAILED'
    end

    test_number += 1
  end

  p 'MY_INJECT SUCCESFUL'
end