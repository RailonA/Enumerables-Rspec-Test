module Enumerable

#comment

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
        proc.cal arr[i],i
        i += 1
      end
    else
      while i < arr.length
        yield arr[i],i
        i += 1
      end
    end  

    arr
  end

  def my_select
    return self.to_enum unless block_given?

    arr = to_a
    arr2 = []
    arr.my_each_with_index do |_item, index|
      arr2.push(arr[index]) if yield arr[index]
    end
    arr2
  end

  def my_all?(args= nil)
    return self.to_enum unless block_given? || args != nil
    arr = to_a
    if block_given?
      arr.my_each_with_index do |_item, index|
        return false unless yield arr[index]
      end
    elsif args.is_a? Class
      arr.my_each_with_index do |_item, index|
        return false unless _item.class.ancestors.include?(args)
      end
    elsif args.is_a? Regexp
      arr.my_each_with_index do |_item, index|
        return false unless _item.match(args)
      end
    end  
    true
  end


  
  def my_any?(args= nil)
    return self.to_enum unless block_given? || args != nil
    arr = to_a
    any = false

    if block_given?
      arr.my_each_with_index do |_item, index|
        any = true if yield arr[index]
      end
    elsif args.is_a? Class
      arr.my_each_with_index do |_item, index|
        puts _item.class.ancestors
        any = true if _item.class.ancestors.include?(args)
      end
    elsif args.is_a? Regexp
      arr.my_each_with_index do |_item, index|
        any = true if _item.match(args)
      end
    end  
    any
  end
  

  def my_none?(args= nil)
    return self.to_enum unless block_given? || args != nil
    arr = to_a
    if block_given?
      arr.my_each_with_index do |_item, index|
        return true unless yield arr[index]
      end
    elsif args.is_a? Class
      arr.my_each_with_index do |_item, index|
        return true unless _item.class.ancestors.include?(args)
      end
    elsif args.is_a? Regexp
      arr.my_each_with_index do |_item, index|
        return true unless _item.match(args)
      end
    end  
    false
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

  def my_inject(arg = nil)
    raise 'ERROR' unless block_given?

    arr = to_a
    i = 1
    result = arg.nil? ? arr[0] : arg
    result = '' if result.class == String

    while i < arr.length
      result = yield result, arr[i]
      i += 1
    end

    result
  end

  def my_map(pro = nil)
    raise 'NO BLOCK GIVEN!' unless block_given?

    arr = to_a
    arr2 = []
    if pro
      arr.my_each_with_index do |_item, index|
        arr2.push(proc.cal arr[index])
      end
    else
      arr.my_each_with_index do |_item, index|
        arr2.push(yield arr[index])
      end
    end
    arr2
  end
end

def multiply_els(arr = [])
  arr.my_inject { |total, item| total * item }
end
