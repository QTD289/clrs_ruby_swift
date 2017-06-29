# Problem 2-1 - Insertion sort on small arrays in merge sort
class P21
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
    insertion_sort(ar_a) && return if r - p < 5
    q = (p + r) / 2
    merge_sort(ar_a, p, q)
    merge_sort(ar_a, q + 1, r)
    merge(ar_a, p, q, r)
  end

  def insertion_sort(ar_a)
    (1..(ar_a.length - 1)).each do |i|
      key = ar_a[i]
      j = i - 1
      while j >= 0 && ar_a[j] > key
        ar_a[j + 1] = ar_a[j]
        j -= 1
      end
      ar_a[j + 1] = key
    end
  end
end
