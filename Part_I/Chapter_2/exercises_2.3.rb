# 2.3-1
class Ex231
  def merge(ar_a, p, q, r)
    n1 = q - p + 1
    n2 = r - q
    left = []
    right = []

    (0..(n1 - 1)).each do |i|
      left[i] = ar_a[i + p]
    end

    (0..(n2 - 1)).each do |i|
      right[i] = ar_a[i + q + 1]
    end

    i = 0
    j = 0
    (p..r).each do |k|
      if i >= n1
        while k <= r
          ar_a[k] = right[j]
          j += 1
          k += 1
        end
        break
      elsif j >= n2
        while k <= r
          ar_a[k] = left[i]
          i += 1
          k += 1
        end
        break
      end

      if left[i] < right[j]
        ar_a[k] = left[i]
        i += 1
      else
        ar_a[k] = right[j]
        j += 1
      end
    end
  end

  def merge_sort(ar_a, p, r)
    return unless p < r
    q = (p + r) / 2
    merge_sort(ar_a, p, q)
    merge_sort(ar_a, q + 1, r)
    merge(ar_a, p, q, r)
  end
end

# 2.3-5
class Ex235
  def binary_search(ar_a, p, q, k)
    if q - p == 1
      return p if ar_a[p] == k
      return q if ar_a[q] == k
      return nil
    end

    r = (p + q) / 2
    return r if ar_a[r] == k
    if ar_a[r] < k
      p = r
    else
      q = r
    end
    binary_search(ar_a, p, q, k)
  end

  def binary_search_for_insertion_sort(ar_a, p, q, k)
    if q - p == 1
      return p if k < ar_a[p]
      return q
    end

    r = (p + q) / 2
    return r if ar_a[r] == k
    if ar_a[r] < k
      p = r
    else
      q = r
    end
    binary_search_for_insertion_sort(ar_a, p, q, k)
  end
end

# 2.3-6
class Ex236
  def insertion_sort_with_binary_search
    ar_a = [998, 970, 648, 700, 462, 976, 208, 545, 260, 171, 190, 596, 575, 443, 596, 393, 173, 369, 199, 454, 805, 444, 467, 806, 84, 590, 193, 720, 362, 94, 807, 629, 621, 423, 870, 664, 844, 822, 205, 156, 291, 199, 985, 399, 449, 499, 76, 752, 99, 584, 226, 171, 796, 771, 617, 207, 501, 954, 135, 321, 580, 363, 582, 379, 951, 536, 907, 764, 506, 816, 759, 619, 476, 924, 785, 668, 46, 57, 836, 475, 514, 72, 879, 331, 712, 343, 895, 126, 143, 487, 178, 758, 163, 459, 586, 517, 136, 497, 287, 93]
    bs = Ex235.new

    (1..(ar_a.length - 1)).each do |i|
      key = ar_a[i]
      j = bs.binary_search_for_insertion_sort(ar_a, 0, i, key)

      while j < i
        ar_a[i] = ar_a[i - 1]
        i -= 1
      end

      ar_a[j] = key
    end
    ar_a
  end
end

# 2.3-7
class Ex237
  def summable?(ar_a, sum)
    Ex231.new.merge_sort(ar_a, 0, ar_a.size - 1)
    first = 0
    last = ar_a.size - 1

    while ar_a[first] + ar_a[last] != sum
      first += 1 if ar_a[first] + ar_a[last] < sum
      last -= 1 if ar_a[first] + ar_a[last] > sum
      return false if first == last
    end
    puts ar_a[first]
    puts ar_a[last]
    true
  end
end
