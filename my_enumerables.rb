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
    if block_given?
      arr.my_each_with_index do |_item, index|
        return false unless yield arr[index]
      end
    elsif args.is_a? Class
      arr.my_each_with_index do |item, _index|
        return false unless item.class.ancestors.include?(args)
      end
    elsif args.is_a? Regexp
      arr.my_each_with_index do |item, _index|
        return false unless item.to_s.match(args)
      end
    else
      arr.my_each_with_index do |item, _index|
        return false if item == false || item.nil?
      end
    end

    true
  end

  def my_any?(args = nil)
    any = false

    if block_given?
      my_each_with_index do |_item, index|
        any = true if yield arr[index]
      end
    elsif args.is_a? Class
      my_each_with_index do |item, _index|
        puts item.class.ancestors
        any = true if item.class.ancestors.include?(args)
      end
    elsif args.is_a? Regexp
      my_each_with_index do |item, _index|
        any = true if item.match(args)
      end
    else
      my_each_with_index do |item, _index|
        any = true unless item == false || item.nil?
      end
    end
    any
  end

  def my_none?(args = nil)
    arr = to_a
    any = true

    if block_given?
      arr.my_each_with_index do |_item, index|
        any = false if yield arr[index]
      end
    elsif args.is_a? Class
      arr.my_each_with_index do |item, _index|
        any = false if item.class.ancestors.include?(args)
      end
    elsif args.is_a? Regexp
      arr.my_each_with_index do |item, _index|
        any = false if item.match(args)
      end
    else
      arr.my_each_with_index do |item, _index|
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
