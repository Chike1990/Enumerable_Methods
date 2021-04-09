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
end