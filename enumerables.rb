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

    #[1,2,3,4,5].my_each {|number| p number*number}
    #[1,2,3,4,5].my_each { puts 'Chike & Erasmus' }
    
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
  #%w[Chike emmy 123 erasmus cake].my_each_with_index {|x| puts "hello #{x}"}

  
  def my_select
    return enum_for(:my_select) unless block_given?
    arr = []
    to_a.my_each { |n| arr.push(n) if yield(n) }
    arr
   end
 end

#[8,2,5,1,6,3].my_select{|n| n if  p n == }
end