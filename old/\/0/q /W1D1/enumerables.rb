require 'byebug'
class Array

  def my_each(&block)
    i = 0
    while i < self.size
      #p self[i]
      block.call(self[i])
      i += 1
    end

    self
  end

  def my_select(&block)
    results = []
    i = 0
    while i < self.size
      results << self[i] if block.call(self[i]) == true
      i+=1
    end

    results
  end

  def my_reject(&block)
    results = []
    i = 0
    while i < self.size
      results << self[i] if !block.call(self[i])
      i+=1
    end

    results
  end

  def my_any(&block)
    i = 0
    while i < self.size
      return true if block.call(self[i])
      i += 1
    end
    false
  end

  def my_all(&block)
    i = 0
    while i < self.size
      return false if !block.call(self[i])
      i += 1
    end
    true
  end

  def my_flatten
    result = []
    self.each do |el|
      #debugger
      if !el.is_a?(Array)
        result << el
      else
        result = result + el.my_flatten
      end
    end

    result
  end

  def my_zip(*args)
    results = Array.new(self.size){Array.new()}
    i = 0
    while i < self.size
      j = 0
      results[i] << self[i]
      while j < args.size
        results[i] << args[j][i]
        j += 1
      end
      i += 1
    end

    results
  end

  def my_rotate(shift = 1)

    result = []
    self.each_with_index do |el, idx|
      if shift > 0
        current_idx = (idx + shift) % self.size
      else
        current_idx = (idx - shift) % self.size
      end
      result[current_idx] = el
    end

    result
  end


  def my_join(str = "")
    string = ""
    self.each do |el|
      string += el + str
    end

    string
  end

  def my_reverse
    siz = self.size
    ind = self.size - 1
    #debugger
    ar = Array.new(self.size)
    while ind >= 0 do
      newin = (siz - 1 ) - ind
      ar[ind] = self[newin]
      ind-=1
    end
    ar
  end

  

end
p [ "a", "b", "c" ].my_reverse   #=> ["c", "b", "a"]
