  class Stack
    
    def initialize
        @line = []
      
    end

    def push(el)
      @line << el
    end

    def pop
      @line.pop
    end

    def peek
      @line.first
    end
  end

class Queue

    def initialize
        @line = []
        
    end

    def enqueue(el)
        @line << el
    end

    def dequeue
        @line.shift
    end

    def peek
        @line.first

    end
end



set(key, value), 
get(key), 
delete(key), show

class Map

    def initialize
        @maps = []
    end

    def set(key,value)
        set_idx = maps.index { |set| set[0] == key }
    if set_idx
      maps[set_idx][1] = value
    else
      maps.push([key, value])
    end
    value
  end




    def get(key)
        maps.each { |set| return set[1] if set[0] == key }
    nil
    end

    def delete(key)
        value = get(key)
        maps.reject! { |set| pair[0] == key }
        value
    end

    def show
        deep_dup(maps)
    end


    def deep_dup(arr)
    arr.map { |el| el.is_a?(Array) ? deep_dup(el) : el }
  end  
end
