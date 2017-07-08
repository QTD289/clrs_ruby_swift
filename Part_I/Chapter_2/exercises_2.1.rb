# 2.1-1
def ex_2_1_1
  ar_A = [31, 41, 59, 26, 41, 58]

  (1..(ar_A.length - 1)).each do |i|
    key = ar_A[i]
    j = i - 1
    while j >= 0 && ar_A[j] > key
      ar_A[j + 1] = ar_A[j]
      j -= 1
    end
    ar_A[j + 1] = key
  end
  puts ar_A.inspect
end

# 2.1-2
def ex_2_1_2
  ar_A = [31, 41, 59, 26, 41, 58]

  (1..(ar_A.length - 1)).each do |i|
    key = ar_A[i]
    j = i - 1
    while j >= 0 && ar_A[j] < key
      ar_A[j + 1] = ar_A[j]
      j -= 1
    end
    ar_A[j + 1] = key
  end
  puts ar_A.inspect
end