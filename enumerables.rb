module Enumerable
  def my_each
    return enum_for(:my_each) unless block_given?

    i = 0
    while i < to_a.length
      yield(to_a[i])
      i += 1
    end
    self
  end

  # [1,2,3,4,5].my_each {|number| p number*number}
  # [1,2,3,4,5].my_each { puts 'Chike & Erasmus' }

  def my_each_with_index
    return enum_for(:my_each_with_index) unless block_given?

    i = 0
    while i < to_a.length
      yield(to_a[i])
      i += 1
    end
    self
  end
  # [1,2,3,4,5].my_each_with_index {|index ,number| p index *2}
  # %w[Chike emmy 123 erasmus cake].my_each_with_index {|x| puts "hello #{x}"}

  def my_select
    return enum_for(:my_select) unless block_given?

    arr = []
    to_a.my_each { |n| arr.push(n) if yield(n) }
    arr
  end

  # [8,2,5,1,6,3].my_select{|n| puts "number greater than 6 #{n}"}

  def my_all?(param = nil)
    if block_given?
      to_a.my_each { |n| return false unless yield(n) }
    elsif param.nil?
      to_a.my_each { |n| return false if !n || n.nil? }
    elsif !param.nil? && (param.is_a? Class)
      to_a.my_each { |n| return false unless [n.class, n.class.superclass, n.class.superclass].include?(param) }
    elsif !param.nil? && (param.is_a? Regexp)
      to_a.my_each { |n| return false unless n.match(param) }
    else
      to_a.my_each { |n| return false unless n == param }
    end
    true
  end

  # [5,5,5].my_all? {|p| puts "The cond is #{p}"}
  # [9,3,3,9].my_all? {|p| puts "The cond is #{p}"}
end
