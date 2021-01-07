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
    arr
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

    arr
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
    return to_enum unless block_given? || !args.nil?

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
        return false unless item.match(args)
      end
    end
    true
  end

  def my_any?(args = nil)
    return to_enum unless block_given? || !args.nil?

    arr = to_a
    any = false

    if block_given?
      arr.my_each_with_index do |_item, index|
        any = true if yield arr[index]
      end
    elsif args.is_a? Class
      arr.my_each_with_index do |item, _index|
        puts item.class.ancestors
        any = true if item.class.ancestors.include?(args)
      end
    elsif args.is_a? Regexp
      arr.my_each_with_index do |item, _index|
        any = true if item.match(args)
      end
    end
    any
  end

  def my_none?(args = nil)
    return to_enum unless block_given? || !args.nil?

    arr = to_a
    if block_given?
      arr.my_each_with_index do |_item, index|
        return true unless yield arr[index]
      end
    elsif args.is_a? Class
      arr.my_each_with_index do |item, _index|
        return true unless item.class.ancestors.include?(args)
      end
    elsif args.is_a? Regexp
      arr.my_each_with_index do |item, _index|
        return true unless item.match(args)
      end
    end
    false
  end

  def my_count(arg = nil)
    arr = to_a
    index = 0
    count = 0
    
    if arg
      while index < arr.length
        puts 'ha'
        count += 1 if proc.call arr[index]
        index += 1
      end
    elsif block_given?
      while index < arr.length
        count += 1 if yield arr[index]
        index += 1
      end
    else
      arr.my_each do |_item|
        count += 1 if arg == arr[index]
        index += 1
      end
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
    arr = to_a
    i = 1
    result = arg
    if arg.is_a? Symbol
      sym = arg
      result = arr[0]
    end
    if sym
      i = 0
      while i < arr.length
        result = result.send sym, arr[i]
        i += 1
      end
      result
    end
    while i < arr.length
      result = yield result, arr[i]
      i += 1
    end
    result
  end

  def multiply_els(arr = [])
    arr.my_inject { |total, item| total * item }
  end
end
