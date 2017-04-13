a = Array.new(9)
b = a.map do |row|
  (1..9).to_a
end

c = []
b.each_slice(3) do |thirds|
  thirds.transpose.each_slice(3) do |block|
    c << block.flatten
  end
end
p c
