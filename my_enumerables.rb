# rubocop:disable Metrics/ModuleLength
# rubocop:disable Metrics/CyclomaticComplexity
# rubocop:disable Metrics/PerceivedComplexity
module Enumerable
  def my_each(pro = nil)
    return to_enum unless block_given?

    arr = to_a
    i = 0

    if pro
      while i < arr.length
        proc.cal arr[i]
        i += 1
      end
    else
      while i < arr.length
        yield arr[i]
        i += 1
      end
    end
    self
  end

  def my_each_with_index(pro = nil)
    return to_enum unless block_given?

    arr = to_a
    i = 0

    if pro
      while i < arr.length
        proc.cal arr[i], i
        i += 1
      end
    else
      while i < arr.length
        yield arr[i], i
        i += 1
      end
    end

    self
  end

  def my_select
    return to_enum unless block_given?

    arr = to_a
    arr2 = []
    arr.my_each_with_index do |_item, index|
      arr2.push(arr[index]) if yield arr[index]
    end
    arr2
  end

  def my_all?(args = nil)
    arr = to_a

    arr.my_each_with_index do |item, index|
      if block_given?
        return false unless yield arr[index]
      elsif args.is_a? Class
        return false unless item.class.ancestors.include?(args)
      elsif args.is_a? Regexp
        return false unless item.to_s.match(args)
      elsif args
        return false if item != args
      elsif item == false || item.nil?
        return false
      end
    end

    true
  end

  def my_any?(args = nil)
    any = false

    if block_given?
      my_each_with_index do |_item, index|
        any = true if yield self[index]
      end
    elsif args.is_a? Class
      my_each_with_index do |item, _index|
        any = true if item.class.ancestors.include?(args)
      end
    elsif args.is_a? Regexp
      my_each_with_index do |item, _index|
        any = true if item.match(args)
      end
    else
      my_each_with_index do |item, _index|
        any = true unless item == false || item.nil? || !item.to_s.match(args.to_s)
      end
    end
    any
  end

  def my_none?(args = nil)
    arr = to_a
    any = true
      arr.my_each_with_index do |item, index|
        if block_given?
          any = false if yield arr[index]
        elsif args.is_a? Class
          any = false if item.class.ancestors.include?(args)
        elsif args.is_a? Regexp
          any = false if item.match(args)
        elsif args
          any = false if args == item
        else
          any = false unless item == false || item.nil?
        end
      end
    any
  end

  def my_count(arg = nil)
    index = 0
    count = 0

    return length if arg.nil? && !block_given?

    while index < length
      if (arg.is_a?(Proc) && proc.call(self[index])) ||
         (arg == self[index])
        count += 1
      elsif block_given?
        count += 1 if yield self[index]
      end

      index += 1
    end

    count
  end

  def my_map(pro = nil)
    return to_enum unless block_given?

    arr = to_a
    arr2 = []
    if pro
      arr.my_each_with_index do |_item, index|
        arr2.push(proc.cal(arr[index]))
      end
    else
      arr.my_each_with_index do |_item, index|
        arr2.push(yield arr[index])
      end
    end
    arr2
  end

  def my_inject(arg = self[0], sym = nil)
    i = 0
    result = arg

    if arg.is_a? Symbol
      i += 1
      sym = arg
      result = self[0]
    end

    while i < length
      if sym
        p 'this'
        result = result.send sym, self[i]
      elsif arg && block_given?
        p 'that'
        result = yield result, self[i]
      end

      i += 1
    end

    result
  end
end

def multiply_els(arr = [])
  arr.my_inject { |total, item| total * item }
end

# rubocop:enable Metrics/ModuleLength
# rubocop:enable Metrics/CyclomaticComplexity
# rubocop:enable Metrics/PerceivedComplexity
