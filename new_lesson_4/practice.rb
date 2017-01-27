arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

def descending(arr)
  arr.map do |sub_arr|
    sub_arr.sort { |a, b| b <=> a } 
  end
end

p descending(arr)