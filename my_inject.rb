# frozen_string_literal: true

module Enumerable
  def my_inject
    raise 'ERROR' unless block_given?

    arr = to_a
    i = 0
    result = 0

    result = '' if result.class == String

    while i < arr.length
      yield result, arr[i]
      i += 1
    end

    result
  end
end
