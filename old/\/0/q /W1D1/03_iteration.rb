def factors(num)
  results = []
  i = 1
  while i < num
    results << i if num % i == 0
    i+=1
  end

  results
end

#p factors(9)
def bubble_sort(arr)
  swapped = true
  while swapped
    swapped = false
    i = 0
    while i < arr.size - 1
      if arr[i] > arr[i+1]
        arr[i], arr[i+1] = arr[i+1], arr[i]
        swapped = true
      end
      i+=1
    end
  end
  arr
end


class Array

  def my_map(&prc)
    res = []
    self.each {|el| res << prc.call(el)}
    res
  end

  def my_select(&prc)
    res = []
    self.each {|el| res << el if prc.call(el)}
    res
  end

  def my_inject(&blc)
    res = self[0]
    i = 1
    while i < self.size
      res = blc.call(res, self[i])
      i+=1
    end
    res
  end

  def bubble_sort(&prc)
    swapped = true
    while swapped
      swapped = false
      i = 0
      while i < self.size - 1
        puts prc.call(self[i], self[i+1])
        if prc.call(self[i], self[i+1]) == 1
          self[i], self[i+1] = self[i+1], self[i]
          swapped = true
        end
        i+=1
      end
    end
  self
  end
end

[9,8,7,5,4,3].bubble_sort { |num1, num2| num1 <=> num2 } #sort ascending
[9,8,7,5,4,3].bubble_sort { |num1, num2| num2 <=> num1 } #sort descending


def substrings(str)
  results = []
  chars = str.chars
  i = 0
  while i < chars.size - 1
    j = i
    string = ""
    while j < chars.size
      string = string + str.slice(i..j)
      results << string
      j += 1
      string = ""
    end
    i += 1
  end
  results << str[i]
  results
end


def subwords(word, dictionary)
  subs = substrings(word)
  subs.reject { |word| !dictionary.include?(word) }
end

def doubler(arr)
  new_arr = arr.map { |num| num * 2 }
end


def concatenate(strings)
  new_str = strings.inject { |str, word| str + word}
end



p concatenate(["Yay ", "for ", "strings!"])
