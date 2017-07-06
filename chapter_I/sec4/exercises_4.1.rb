# Exercises for Chapter 4 - Sec 4.1
class Ex41
  class << self
    # 4.1.2 - Brute force maximum subarray problem
    def brute_force_subarray(ar_a)
      n = ar_a.size
      max = -999_999_999
      (0..n - 1).each do |i|
        sum = 0
        (i..n - 1).each do |j|
          sum += ar_a[j]
          max = sum if sum > max
        end
      end
      max
    end
    # end of 4.1.2

    # 4.1.3 - Divide & Conquer maximum subarray problem
    def max_crossing(ar_a, l, m, h)
      max_left = -999_999_999
      index_left = nil
      sum = 0
      m.downto(l) do |i|
        sum += ar_a[i]
        if sum > max_left
          max_left = sum
          index_left = i
        end
      end

      max_right = -999_999_999
      index_right = nil
      sum = 0
      (m + 1..h).each do |i|
        sum += ar_a[i]
        if sum > max_right
          max_right = sum
          index_right = i
        end
      end
      [index_left, index_right, max_left + max_right]
    end

    def max_subarray(ar_a, l, h)
      return [l, h, ar_a[l]] if l == h
      m = (l + h) / 2
      left = max_subarray(ar_a, l, m)
      right = max_subarray(ar_a, m + 1, h)
      cross = max_crossing(ar_a, l, m, h)

      return left if left[2] > right[2] && left[2] > cross[2]
      return right if right[2] > left[2] && right[2] > cross[2]
      cross
    end
    # end of 4.1.3
  end
end
