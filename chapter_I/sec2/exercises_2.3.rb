# 2.3-1
class Ex_2_3_1
  def merge(ar_A, p, q, r)
    n1 = q - p + 1
    n2 = r - q
    left = []
    right = []

    (0..(n1 - 1)).each do |i|
      left[i] = ar_A[i + p]
    end

    (0..(n2 - 1)).each do |i|
      right[i] = ar_A[i + q + 1]
    end

    i = 0
    j = 0
    (p..r).each do |k|
      if i >= n1
        while k <= r
          ar_A[k] = right[j]
          j += 1
          k += 1
        end
        return
      elsif j >= n2
        while k <= r
          ar_A[k] = left[i]
          i += 1
          k += 1
        end
        return
      end

      if left[i] < right[j]
        ar_A[k] = left[i]
        i += 1
      else
        ar_A[k] = right[j]
        j += 1
      end
    end
  end

  def merge_sort(ar_A, p, r)
    return unless p < r
    q = (p + r) / 2
    merge_sort(ar_A, p, q)
    merge_sort(ar_A, q + 1, r)
    merge(ar_A, p, q, r)
  end
end
