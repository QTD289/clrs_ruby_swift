# Exercises for Chapter 4 - Sec 4.2
class Ex42
  class << self
    # Square maxtrix multiply
    def square_matrix_multiply(a, b)
      n = a.size
      ret = []
      (0..n - 1).each do |i|
        ret.push([])
        (0..n - 1).each do |j|
          c = 0
          (0..n - 1).each do |k|
            c += a[i][k] * b[k][j]
          end
          ret[i].push(c)
        end
      end
      ret
    end
    # End of square maxtrix multiply
  end
end
