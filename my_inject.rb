# frozen_string_literal: true

module Enumerable
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

multiply_els